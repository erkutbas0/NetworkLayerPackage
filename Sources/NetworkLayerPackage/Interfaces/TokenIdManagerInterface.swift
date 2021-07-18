//
//  File.swift
//  
//
//  Created by Erkut Bas on 19.07.2021.
//

import Foundation

public protocol TokenIdManagerInterface {
    
    func refreshAccessToken(with completion: @escaping (String) -> Void)
    
}
