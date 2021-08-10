//
//  ApiRequestRetrier.swift
//  NetworkLayerPackage
//
//  Created by Erkut Bas on 26.03.2021.
//

import Foundation
import Alamofire
import CredentialManagement

final public class ApiRequestRetrier: RequestRetrier {

    // MARK: - Manager Properties -
    private let refreshingLock = NSLock()
    
    // MARK: - Injected Modules -
    private let tokenProvider: TokenProviderProtocol
    
    public init(tokenProvider: TokenProviderProtocol) {
        self.tokenProvider = tokenProvider
    }
    
    // MARK: - Public Methods -
    public func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        print("retry")
        
        guard let task = request.task, let response = task.response as? HTTPURLResponse else {
            completion(.doNotRetry)
            return
        }
        
        switch response.statusCode {
        case 401:
            tokenRefreshingProcess(with: completion)
        default:
            completion(.doNotRetry)
        }
        
    }
    
    // MARK: - Private Methods -
    private func tokenRefreshingProcess(with completion: @escaping (RetryResult) -> Void) {
        if !tryLock() {
            // retrier is already processing, locked. retry after 3 seconds
            completion(.retryWithDelay(3))
            return
        }
        
        tokenProvider.refreshAccessToken { [weak self] refreshed in
            self?.unLock()
            refreshed ? completion(.retry) : completion(.doNotRetry)
        }
        
    }
    
    private func tryLock() -> Bool {
        return refreshingLock.try()
    }
    
    private func unLock() {
        refreshingLock.unlock()
    }
}
