//
//  Student.swift
//  StudentAPI
//
//  Created by Sean Gleason on 10/19/16.
//  Copyright © 2016 SeanGleason. All rights reserved.
//

import Foundation


struct Student {
    
    let name: String
}

extension Student {
    
    static let nameKey = "name"
    
    var dictionaryRepresentation: [String: Any] {
        
        return [Student.nameKey: name as Any]
    }

    var jsonData: Data? {
        return try? JSONSerialization.data(withJSONObject: dictionaryRepresentation, options: .prettyPrinted)
    }
}


    init?(dictionary: [String : String]) {
        
        guard let name = dictionary[nameKey] else {
            return nil
        }
        
        self.init(name: name)
    }
}
