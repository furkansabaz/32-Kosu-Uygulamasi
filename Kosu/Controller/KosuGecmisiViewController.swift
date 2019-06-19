//
//  SecondViewController.swift
//  Kosu
//
//  Created by Furkan Sabaz on 14.06.2019.
//  Copyright © 2019 Furkan Sabaz. All rights reserved.
//

import UIKit

class KosuGecmisiViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
}


extension KosuGecmisiViewController : UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Kosu.kosularinTumunuGetir()?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "KosuKayitCell") as? KosuKayitCell {
            guard let kosu = Kosu.kosularinTumunuGetir()?[indexPath.row] else {   return KosuKayitCell()  }
            
            cell.gorunumAyarla(kosu: kosu)
            return cell
        } else {
            return KosuKayitCell()
        }
        
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
}
