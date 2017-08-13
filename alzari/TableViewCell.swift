//
//  TableViewCell.swift
//  alzari
//
//  Created by AbedMac on 8/12/17.
//  Copyright © 2017 AbedMac. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var videoImag: UIView!
     @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
