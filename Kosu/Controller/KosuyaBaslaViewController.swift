//
//  KosuyaBaslaViewController.swift
//  Kosu
//
//  Created by Furkan Sabaz on 14.06.2019.
//  Copyright © 2019 Furkan Sabaz. All rights reserved.
//

import UIKit
import MapKit

class KosuyaBaslaViewController: KonumViewController {

    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        izinKontrol()
        mapView.delegate = self
        
        print("Tüm Koşular : \(Kosu.kosularinTumunuGetir())")
    }

    override func viewWillAppear(_ animated: Bool) {
        manager?.delegate = self
        manager?.startUpdatingLocation()
    }
    override func viewWillDisappear(_ animated: Bool) {
        manager?.stopUpdatingLocation()
    }
    @IBAction func btnKonumMerkezPressed(_ sender: Any) {
    }
    
}


extension KosuyaBaslaViewController : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        if status == .authorizedWhenInUse {
            izinKontrol()
            mapView.showsUserLocation = true
            mapView.userTrackingMode = .follow
        }
    }
    
    
}
