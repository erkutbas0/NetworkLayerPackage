//
//  ApiManager.swift
//  NetworkLayerPackage
//
//  Created by Erkut Bas on 22.03.2021.
//

import Foundation
import Alamofire
import Combine
import NetworkEntityPackage

final class ApiManager: ApiManagerInterface {

    private var session: Session!
    private var jsonDecoder = JSONDecoder()
    
    init(interceptor: RequestInterceptor? = nil, eventMonitoringModules: [EventMonitor] = [EventMonitor]()) {
        
        let configuration = URLSessionConfiguration.ephemeral
        configuration.timeoutIntervalForRequest = 60
        configuration.requestCachePolicy = .reloadIgnoringCacheData
        
        // add server trust manager
        
        session = Session(configuration: configuration, startRequestsImmediately: true, interceptor: interceptor, eventMonitors: eventMonitoringModules)
        
    }
    
    func execute<R>(_ urlRequestConvertible: URLRequestConvertible) -> Future<R, ErrorResponse> where R : Decodable, R : Encodable {
        
        return Future { (promise) in
            self.session.request(urlRequestConvertible).validate().response { (data) in
                self.responseParser(with: data, via: promise)
            }
        }
        
    }
    
    private func responseParser<R>(with alamofireData: AFDataResponse<Data?>, via promise: (Result<R, ErrorResponse>) -> Void) where R: Decodable, R : Encodable {
        
        switch alamofireData.result {
        case .failure(let error):

            if let data = alamofireData.data {
                do {
                    // server side returns logical business error message
                    let dataDecoded = try jsonDecoder.decode(ServerResponse.self, from: data)
                    promise(.failure(ErrorResponse(serverResponse: dataDecoded, apiConnectionErrorType: .serverError(self.returnStatusCode(data: alamofireData)))))
                } catch _ {
                    // unacceptable status codes, data can not be decoded such as internal server errors 500 etc...
                    promise(.failure(ErrorResponse(apiConnectionErrorType: .missingData(self.returnStatusCode(data: alamofireData)))))
                }
            } else {
                // In the circumstances the client can not reach server side, there is no data can be decoded. For instance time out cases.
                promise(.failure(ErrorResponse(apiConnectionErrorType: .connectionError(self.returnErrorCode(error: error)))))
            }
            
        case .success(let data):
            if let data = data {
                
                do {
                    let dataDecoded = try jsonDecoder.decode(R.self, from: data)
                    promise(.success(dataDecoded))
                } catch let error {
                    promise(.failure(ErrorResponse(apiConnectionErrorType: .dataDecodedFailed(error.localizedDescription))))
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
    
    
}
