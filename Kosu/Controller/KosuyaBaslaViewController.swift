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

    @IBOutlet weak var lblMesafe: UILabel!
    @IBOutlet weak var lblSure: UILabel!
    @IBOutlet weak var lblTempo: UILabel!
    @IBOutlet weak var btnSonKosuKapat: UIButton!
    @IBOutlet weak var stackViewSonKosu: UIStackView!
    @IBOutlet weak var viewSonKosu: UIView!
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        izinKontrol()
        mapView.delegate = self
        
        print(Kosu.kosularinTumunuGetir())
        
    }

    override func viewWillAppear(_ animated: Bool) {
        manager?.delegate = self
        manager?.startUpdatingLocation()
        sonKosuBilgileriniGetir()
    }
    override func viewWillDisappear(_ animated: Bool) {
        manager?.stopUpdatingLocation()
    }
    @IBAction func btnKonumMerkezPressed(_ sender: Any) {
    }
    @IBAction func btnSonKosuKapat(_ sender: Any) {
        stackViewSonKosu.isHidden = true
        viewSonKosu.isHidden = true
        btnSonKosuKapat.isHidden = true
    }
    
    
    func sonKosuBilgileriniGetir() {
        
        
        guard let sonKosu = Kosu.kosularinTumunuGetir()?.first else {
            stackViewSonKosu.isHidden = true
            viewSonKosu.isHidden = true
            btnSonKosuKapat.isHidden = true
            return
        }
        print("Son Koşu Getirildi")
        stackViewSonKosu.isHidden = false
        viewSonKosu.isHidden = false
        btnSonKosuKapat.isHidden = false
        
        lblMesafe.text = "Mesafe : \(String(format:"%.2f",sonKosu.mesafe/1000))"
        lblSure.text = "Süre : \(sonKosu.sure.saniyeSureCevir())"
        lblTempo.text = "Tempo : \(sonKosu.tempo.saniyeSureCevir())"
        
        
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
