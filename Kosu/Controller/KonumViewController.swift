//
//  KonumViewController.swift
//  Kosu
//
//  Created by Furkan Sabaz on 16.06.2019.
//  Copyright © 2019 Furkan Sabaz. All rights reserved.
//

import UIKit
import MapKit
class KonumViewController: UIViewController, MKMapViewDelegate {

    var manager : CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager = CLLocationManager()
        manager?.desiredAccuracy = kCLLocationAccuracyBest
        manager?.activityType = .fitness
    }
    
    func izinKontrol() {
        
        if CLLocationManager.authorizationStatus() != .authorizedWhenInUse {
            manager?.requestWhenInUseAuthorization()
        }
        
    }
    

    

}
