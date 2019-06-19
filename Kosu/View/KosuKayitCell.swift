//
//  KosuKayitCell.swift
//  Kosu
//
//  Created by Furkan Sabaz on 19.06.2019.
//  Copyright © 2019 Furkan Sabaz. All rights reserved.
//

import UIKit

class KosuKayitCell: UITableViewCell {
    
    @IBOutlet weak var lblSure: UILabel!
    @IBOutlet weak var lblMesafe: UILabel!
    @IBOutlet weak var lblTempo: UILabel!
    @IBOutlet weak var lblTarih: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    func gorunumAyarla(kosu : Kosu) {
        
        lblSure.text = kosu.sure.saniyeSureCevir()
        lblMesafe.text = String(format:"%.2f", kosu.mesafe/1000)
        lblTempo.text = kosu.tempo.saniyeSureCevir()
        lblTarih.text = "\(kosu.tarih.tarihGetir())"
        
    }

}
