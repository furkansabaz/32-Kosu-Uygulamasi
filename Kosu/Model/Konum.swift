//
//  Konum.swift
//  Kosu
//
//  Created by Furkan Sabaz on 19.06.2019.
//  Copyright © 2019 Furkan Sabaz. All rights reserved.
//

import Foundation
import RealmSwift

class Konum : Object {
    @objc dynamic var latitude = 0.0
    @objc dynamic var longitude = 0.0
    
    convenience init(latitude : Double, longitude : Double) {
        self.init()
        self.latitude = latitude
        self.longitude = longitude
    }
}
