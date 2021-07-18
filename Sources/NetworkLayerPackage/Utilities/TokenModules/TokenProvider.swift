//
//  TokenProvider.swift
//  
//
//  Created by Erkut Bas on 29.03.2021.
//

import Foundation
import Valet

public final class TokenProvider: TokenProviderInterface {
    
    private let tokendIdManager: TokenIdManagerInterface
    
    public init(tokendIdManager: TokenIdManagerInterface) {
        self.tokendIdManager = tokendIdManager
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
    
    public func refreshAccessToken(with completion: @escaping (Bool) -> Void) {
        tokendIdManager.refreshAccessToken { [weak self] newToken in
            self?.setAccessToken(with: newToken)
            completion(true)
        }
    }
    
}
