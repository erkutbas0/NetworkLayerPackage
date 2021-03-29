//
//  AccessTokenDataStore.swift
//  
//
//  Created by Erkut Bas on 29.03.2021.
//

import Foundation

struct AccessTokenDataStore {
    @ValetStringKeyWrapper("accessToken", value: nil)
    static var currentAccessToken: String?

    @ValetStringKeyWrapper("refreshToken", value: nil)
    static var currentRefreshToken: String?
}

