//
//  File.swift
//  
//
//  Created by Erkut Bas on 19.07.2021.
//

import Foundation

public enum TokenIdManagerErrorType: Error {
    case tokenRevoked
    case unknownError
}

public protocol TokenIdManagerInterface {
    
    func refreshAccessToken(with completion: @escaping (Result<String, TokenIdManagerErrorType>) -> Void)
    
}
