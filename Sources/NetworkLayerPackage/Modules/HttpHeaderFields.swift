//
//  HttpHeaderFields.swift
//  NetworkLayerPackage
//
//  Created by Erkut Bas on 26.03.2021.
//

import Foundation
import Alamofire

enum HTTPHeaderFields {
    
    case contentType
    
    var value: HTTPHeader {
        switch self {
        case .contentType:
            return HTTPHeader(name: "Content-Type", value: "application/json; charset=utf-8")
        }
    }

}
