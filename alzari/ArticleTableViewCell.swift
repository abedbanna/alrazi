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
        guard let url = URL(string: myArticles[(sender as! UIButton).tag].URL) else {
            return //be safe
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
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
