//
//  Extensions.swift
//  Kosu
//
//  Created by Furkan Sabaz on 18.06.2019.
//  Copyright © 2019 Furkan Sabaz. All rights reserved.
//

import Foundation


extension Int {
    
    func saniyeSureCevir() -> String {
        
        let saat = self / 3600
        let dakika = (self % 3600) / 60
        let saniye = (self % 3600) % 60
        
        
        if saniye < 0 {
            return "00:00:00"
        } else {
            if saat == 0 {
                return String(format: "%02d:%02d",dakika,saniye)
            } else {
                return String(format: "%02d:%02d:%02d",saat,dakika,saniye)
            }
        }
    }
    
}
