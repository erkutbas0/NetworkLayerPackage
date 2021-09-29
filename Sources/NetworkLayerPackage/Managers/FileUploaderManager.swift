//
//  File.swift
//  
//
//  Created by Erkut Bas on 29.09.2021.
//

import Foundation
import NetworkEntityPackage
import Combine
import Alamofire

public final class FileUploaderManager: FileUploaderProtocol {
    
    private var session: Session!
    private var jsonDecoder = JSONDecoder()
    
    public init(eventMonitors: [EventMonitor] = []) {
        
        let configuration = URLSessionConfiguration.ephemeral
        configuration.timeoutIntervalForRequest = 60
        configuration.requestCachePolicy = .reloadIgnoringCacheData
        
        // add server trust manager
        session = Session(configuration: configuration, startRequestsImmediately: true, eventMonitors: eventMonitors)
        
    }
    
    public func execute(_ data: Data, _ urlRequestConvertible: URLRequestConvertible, with progressHandler: @escaping Request.ProgressHandler) -> Future<Void, ErrorResponse> {
        return Future<Void, ErrorResponse> { promise in
            self.session.upload(data, with: urlRequestConvertible).uploadProgress(closure: progressHandler).validate().response { response in
                switch response.result {
                case .failure(let error):
                    promise(.failure(ErrorResponse(serverResponse: ServerResponse(message: error.localizedDescription, errorCode: error.responseCode), apiConnectionErrorType: .serverError(self.returnErrorCode(error: error)))))
                case .success(_):
                    promise(.success(()))
                }
            }
        }
    }
    
    private func returnStatusCode(data: AFDataResponse<Data?>) -> Int {
        guard let response = data.response else { return 0 }
        return response.statusCode
    }

    private func returnErrorCode(error: AFError) -> Int {
        guard let underlyingError = error.underlyingError else { return NSURLErrorUnknown }
        return underlyingError._code
    }
    
    deinit {
        print("DEINIT ApiManager")
    }
    
}
