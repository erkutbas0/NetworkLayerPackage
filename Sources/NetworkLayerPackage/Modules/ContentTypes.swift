//
//  File.swift
//  
//
//  Created by Erkut Bas on 30.09.2021.
//

import Foundation

public enum ContentTypes: String, CustomStringConvertible {
 
    public var description: String {
        return rawValue
    }
    
    case applicationJson = "application/json; charset=utf-8"
    case imageJpeg = "image/jpeg"
    
}
