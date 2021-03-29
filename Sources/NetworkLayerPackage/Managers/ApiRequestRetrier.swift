//
//  ApiRequestRetrier.swift
//  NetworkLayerPackage
//
//  Created by Erkut Bas on 26.03.2021.
//

import Foundation
import Alamofire

final public class ApiRequestRetrier: RequestRetrier {

    public init() {
        
    }
    
    public func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        print("retry")
        guard let task = request.task, let response = task.response as? HTTPURLResponse else {
            completion(.doNotRetry)
            return
        }
        
        completion(.doNotRetry)
        
    }
    
}
