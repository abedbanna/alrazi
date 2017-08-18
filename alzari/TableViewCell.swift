//
//  TableViewCell.swift
//  alzari
//
//  Created by AbedMac on 8/12/17.
//  Copyright © 2017 AbedMac. All rights reserved.
//

import UIKit
var myFav:[Video]=[]
class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var videoImag: UIView!
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var btnFav: UIButton!
    
    
    
    @IBOutlet weak var lblAuthor: UILabel!
    @IBAction func addToFavorite(_ sender: Any) {
       
        let index = (sender as! UIButton).tag
        
        
        let alertController = UIAlertController(title: "Favorite List", message:"Video in your favorite list", preferredStyle: UIAlertControllerStyle.alert)
        
        
        let confirmed = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: {
        (action: UIAlertAction!) in
            myFav.append(myList[index])
        })
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        
        alertController.addAction(confirmed)
        alertController.addAction(cancel)
      UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)

        
        
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
