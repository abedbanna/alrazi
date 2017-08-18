
//
//  Video.swift
//  alzari
//
//  Created by AbedMac on 8/18/17.
//  Copyright © 2017 AbedMac. All rights reserved.
//

import UIKit

class Video: NSObject, NSCoding  {

    var myTitle:String=""
    var myAuthor:String=""
    var myYoutube:String=""
        var myImage:UIImage?=nil
    
    
    
    required init(title:String, author:String,youtube:String, image:UIImage) {
        
        myTitle=title
        myAuthor=author
        myYoutube=youtube
        myImage=image
        
        
        
    }
    
    required init(title:String, author:String,youtube:String,url:String) {
        
        myTitle=title
        myAuthor=author
        myYoutube=youtube
        myULR=url
        
        
        
    }
    required init(coder aDecoder: NSCoder) {
        
        myTitle = (aDecoder.decodeObject(forKey: "title") as? String)!
        myAuthor = (aDecoder.decodeObject(forKey: "author") as? String)!
        myYoutube = (aDecoder.decodeObject(forKey: "youtube") as? String)!
        myImage = (aDecoder.decodeObject(forKey: "image") as? UIImage)!
        myULR = (aDecoder.decodeObject(forKey: "url") as? String)!
        
    }
    
    
    public func encode(with aCoder: NSCoder) {
        
        aCoder.encode(Title, forKey: "title")
        aCoder.encode(Author, forKey: "author")
        aCoder.encode(Youtube, forKey: "youtube")
        aCoder.encode(Image, forKey: "image")
          aCoder.encode(URL, forKey: "url")
    }
    
    
     var myULR:String=""
    var Title:String{
    get
    {
        return self.myTitle
        }
        
        set
        {
        
        self.myTitle=newValue
        }
    
    }
    
    
    
    var Author:String{
        get
        {
            return self.myAuthor
        }
        
        set
        {
            
            self.myAuthor=newValue
        }
        
    }
    
    
    var Youtube:String{
        get
        {
            return self.myYoutube
        }
        
        set
        {
            
            self.myYoutube=newValue
        }
        
    }
    
    
    
    
    var Image:UIImage
    {
        get{
        return self.myImage!
        }
        set
        {self.myImage=newValue}
    }
    
    var URL:String{
        get
        {
            return self.myULR
        }
        
        set
        {
            
            self.myULR=newValue
        }
        
    }

}
