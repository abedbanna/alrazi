//
//  ArticleTableViewCell.swift
//  alzari
//
//  Created by AbedMac on 8/26/17.
//  Copyright © 2017 AbedMac. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
   
    @IBOutlet weak var btnReadMore: UIButton!
    
    
    @IBAction func btnShowUrl(_ sender: Any) {
        let url =  myArticles[(sender as! UIButton).tag].URL
        
        
      /*  if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }*/
        
        let index = (sender as! UIButton).tag
        selectedVideo =   Video(title: "<#T##String#>", author: "<#T##String#>", youtube: url, url: "<#T##String#>")
        
        
        
        print(index)
        
        // self.window?.rootViewController?.performSegue(withIdentifier: "segue1", sender: self)
        if self.window!.rootViewController as? UITabBarController != nil {
            let tababarController = self.window!.rootViewController as! UITabBarController
            
            tababarController.selectedIndex = 2
        }
    }
    override func awakeFromNib() {
       
        super.awakeFromNib()
       
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
