//
//  TokenProvider.swift
//  
//
//  Created by Erkut Bas on 29.03.2021.
//

import Foundation
import Valet

public final class TokenProvider: TokenProviderInterface {
    
    public init() {
        
    }
    
    public func setAccessToken(with data: String) {
        AccessTokenDataStore.currentAccessToken = data
    }
    
    public func setRefreshToken(with data: String) {
        AccessTokenDataStore.currentRefreshToken = data
    }
    
    public func getAccessToken() -> String? {
        return AccessTokenDataStore.currentAccessToken
    }
    
    public func getRefreshToken() -> String? {
        return AccessTokenDataStore.currentRefreshToken
    }
    
    public func removeTokens() {
        AccessTokenDataStore.currentAccessToken = nil
        AccessTokenDataStore.currentRefreshToken = nil
    }
    
}
