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
        
        guard let identifier = Identifier(nonEmpty: "ValetStringKeyWrapperIdentifier") else { return }
        valet = Valet.valet(with: identifier, accessibility: .whenUnlocked)
    }
    
    var wrappedValue: String? {
        get {
            guard let data = try? valet?.string(forKey: key) else { return nil }
            return data
        }
        
        set {
            if let data = newValue {
                try? valet?.setString(data, forKey: key)
            } else {
                try? valet?.removeObject(forKey: key)
            }
        }
    }
    
}
