//
//  TokenProviderInterface.swift
//  
//
//  Created by Erkut Bas on 29.03.2021.
//

import Foundation

public protocol TokenProviderInterface {
    
    func setAccessToken(with data: String)
    func setRefreshToken(with data: String)
    
    func getAccessToken() -> String?
    func getRefreshToken() -> String?
    
    func removeTokens()
}
