//
//  FavTableViewCell.swift
//  alzari
//
//  Created by AbedMac on 8/18/17.
//  Copyright © 2017 AbedMac. All rights reserved.
//

import UIKit

class FavTableViewCell: UITableViewCell {

    @IBOutlet weak var lblAuthor: UILabel!
    
 
    @IBOutlet weak var btnShow: UIButton!
 
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
    @IBAction func showVideo(_ sender: Any) {
   
        let index = (sender as! UIButton).tag
        selectedVideo = myFav[index]
        print(index)
        
        // self.window?.rootViewController?.performSegue(withIdentifier: "segue1", sender: self)
        if self.window!.rootViewController as? UITabBarController != nil {
            let tababarController = self.window!.rootViewController as! UITabBarController
            
            tababarController.selectedIndex = 2
        }
        

    
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
