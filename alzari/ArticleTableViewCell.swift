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
   
    override func awakeFromNib() {
       
        super.awakeFromNib()
       
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
