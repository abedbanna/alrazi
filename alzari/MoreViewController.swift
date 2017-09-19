//
//  MoreViewController.swift
//  alzari
//
//  Created by AbedMac on 8/29/17.
//  Copyright © 2017 AbedMac. All rights reserved.
//

import UIKit
import GoogleMobileAds
class MoreViewController: UIViewController {
 

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let App = UIApplication.shared.delegate as! AppDelegate
        App.gViewController = self;
        App.showAdmobInterstitial()
        
        
        // Do any additional setup after loading the view.
    }
   
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
