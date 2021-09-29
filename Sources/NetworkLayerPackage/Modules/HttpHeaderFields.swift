//
//  HttpHeaderFields.swift
//  NetworkLayerPackage
//
//  Created by Erkut Bas on 26.03.2021.
//

import Foundation
import Alamofire

enum HTTPHeaderFields {
    
    case contentType(ContentTypes)
    
    var value: HTTPHeader {
        switch self {
        case .contentType(let data):
            return HTTPHeader(name: "Content-Type", value: data.description)
        }
    }

}

