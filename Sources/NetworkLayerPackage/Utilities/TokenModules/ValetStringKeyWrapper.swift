//
//  ValetStringKeyWrapper.swift
//  
//
//  Created by Erkut Bas on 29.03.2021.
//

import Foundation
import Valet

@propertyWrapper
final class ValetStringKeyWrapper {
    
    private var valet: Valet?
    
    private var key: String
    private var value: String?
    
    init(_ key: String, value: String?) {
        self.key = key
        self.value = value
    }
    
    var wrappedValue: String? {
        get {
            guard let data = try? valet?.string(forKey: key) else { return nil }
            return data
        }
        
        set {
            guard let data = newValue else { return }
            try? valet?.setString(data, forKey: key)
        }
    }
    
}
