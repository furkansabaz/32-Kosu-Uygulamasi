//
//  Kosu.swift
//  Kosu
//
//  Created by Furkan Sabaz on 18.06.2019.
//  Copyright © 2019 Furkan Sabaz. All rights reserved.
//

import Foundation
import RealmSwift

class Kosu : Object {
    
    @objc dynamic var id  = ""
    @objc dynamic var tarih = NSDate()
    @objc dynamic var tempo = 0
    @objc dynamic var mesafe = 0.0
    @objc dynamic var sure  = 0
    
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    override static func indexedProperties() -> [String] {
        return ["tarih","sure","tempo"]
    }
    
    convenience init(tempo : Int , sure : Int, mesafe : Double) {
        
        self.init()
        self.id = UUID().uuidString.lowercased()
        self.tarih = NSDate()
        self.mesafe = mesafe
        self.tempo = tempo
        self.sure = sure
        
    }
    
}
