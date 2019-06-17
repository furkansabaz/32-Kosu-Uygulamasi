//
//  KosuyorumViewController.swift
//  Kosu
//
//  Created by Furkan Sabaz on 17.06.2019.
//  Copyright © 2019 Furkan Sabaz. All rights reserved.
//

import UIKit

class KosuyorumViewController: UIViewController {

    @IBOutlet weak var imgKosuOutline: UIImageView!
    @IBOutlet weak var btnKosuBitir: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeGesture = UIPanGestureRecognizer(target: self, action: #selector(kosuyuBitir(sender:)))
        btnKosuBitir.addGestureRecognizer(swipeGesture)
        btnKosuBitir.isUserInteractionEnabled = true
        swipeGesture.delegate = self as? UIGestureRecognizerDelegate
        
    }
    @objc func kosuyuBitir(sender :  UIPanGestureRecognizer) {
        
        
        let minFark : CGFloat = (imgKosuOutline.bounds.size.width - btnKosuBitir.bounds.size.width - 10) / 2
        let maxFark : CGFloat = (imgKosuOutline.bounds.size.width - (5*btnKosuBitir.bounds.size.width/4))
        
        
        if let sliderview = sender.view {
            
            if sender.state == UIGestureRecognizer.State.began || sender.state == UIGestureRecognizer.State.changed {
                
                let translation = sender.translation(in: self.view)
                
                
                if sliderview.center.x >= (imgKosuOutline.center.x - minFark) && sliderview.center.x <= (imgKosuOutline.center.x + maxFark) {
                    sliderview.center = CGPoint(x: sliderview.center.x + translation.x, y: sliderview.center.y)
                }
                else if sliderview.center.x >= (imgKosuOutline.center.x + maxFark) {
                    sliderview.center.x = imgKosuOutline.center.x + maxFark
                    dismiss(animated: true, completion: nil)
                } else {
                    sliderview.center.x = imgKosuOutline.center.x - minFark
                }
                sender.setTranslation(CGPoint.zero, in: self.view)
            }
            
            else if sender.state == UIGestureRecognizer.State.ended {
                UIView.animate(withDuration: 0.2, animations: {
                    sliderview.center.x = self.imgKosuOutline.center.x - minFark
                })
            }
            
        }
        
    }
    


}
