
//
//  Video.swift
//  alzari
//
//  Created by AbedMac on 8/18/17.
//  Copyright © 2017 AbedMac. All rights reserved.
//

import UIKit

class Video: NSObject {

    var myTitle:String=""
    var myAuthor:String=""
    var myYoutube:String=""
        var myImage:UIImage?=nil
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
