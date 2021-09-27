//
//  ApiManagerInterface.swift
//  NetworkLayerPackage
//
//  Created by Erkut Bas on 21.03.2021.
//

import Foundation
import Combine
import Alamofire
import NetworkEntityPackage

public protocol ApiManagerInterface {
    
    func execute<R: Codable>(_ urlRequestConvertible: URLRequestConvertible) -> Future<R, ErrorResponse>
    func execute(_ data: Data, _ urlRequestConvertible: URLRequestConvertible) -> Future<Void, ErrorResponse>
}
