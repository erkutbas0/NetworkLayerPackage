//
//  FileUploaderProtocol.swift
//  
//
//  Created by Erkut Bas on 29.09.2021.
//

import Foundation
import NetworkEntityPackage
import Combine
import Alamofire

public protocol FileUploaderProtocol {
    
    func execute(_ data: Data, _ urlRequestConvertible: URLRequestConvertible, with progressHandler: @escaping Request.ProgressHandler) -> Future<Void, ErrorResponse>
    
}
