//
//  ApiInterceptor.swift
//  NetworkLayerPackage
//
//  Created by Erkut Bas on 26.03.2021.
//

import Foundation
import Alamofire

final public class ApiInterceptor: Interceptor {

    override public init(adapter: RequestAdapter, retrier: RequestRetrier) {
        super.init(adapter: adapter, retrier: retrier)
    }
    
}
