//
//  chasing.swift
//  alzari
//
//  Created by AbedMac on 8/23/17.
//  Copyright © 2017 AbedMac. All rights reserved.
//

import UIKit
let imageCache = NSCache<NSString, UIImage>()
extension UIImageView
{

    func loadImageWithCashe(urlString:String,index:Int)
    {
        
        
        self.image=nil
        //check cashe for image first
        
        if let cashedImage=imageCache.object(forKey: urlString as NSString)
        {
        self.image = cashedImage
            return
        }
        
        
        //otherwise fire off a new image
        let url=URL(string: urlString as String)
        
        let task = URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            // handle the result here
            
            if error != nil
            {
                print(error ?? "error")
                return
            }
            
            DispatchQueue.main.async {
               
                if let downloadedImage = UIImage(data: data!)
                {
                    myList[index].Image=UIImage(data: data!)!
                
                    imageCache.setObject(downloadedImage, forKey: urlString as NSString)
                    
                    self.image = downloadedImage
                }
                
                
                
                
                //myList[indexPath.row].Image=UIImage(data: data!)!
                
            }
            
            
        })
        task.resume()
    }
}
