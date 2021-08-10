//
//  ApiRequestAdapter.swift
//  NetworkLayerPackage
//
//  Created by Erkut Bas on 26.03.2021.
//

import Foundation
import Alamofire
import CredentialManagement

final public class ApiRequestAdapter: RequestAdapter {
    
    private let tokenProvider: TokenProviderProtocol
    
    public init(tokenProvider: TokenProviderProtocol) {
        self.tokenProvider = tokenProvider
    }
    
    public func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var request: URLRequest = urlRequest
        insertAccessToken(to: &request)
        completion(.success(request))
    }
    
    private func insertAccessToken(to urlRequest: inout URLRequest) {
        guard let accessToken = tokenProvider.getAccessToken() else { return }
        urlRequest.addValue(accessToken, forHTTPHeaderField: "Authorization")
    }
    
}
