//
//  ArchiveUtil.swift
//  alzari
//
//  Created by AbedMac on 8/18/17.
//  Copyright © 2017 AbedMac. All rights reserved.
//

import UIKit

class ArchiveUtil: NSObject {

    
    private static let favKey = "fav_list"
    
    private static func archivePeople(people : [Video]) -> NSData {
        
        return NSKeyedArchiver.archivedData(withRootObject: people as NSArray) as NSData
    }
    
    static func loadFav() -> [Video]? {
        
        if let unarchivedObject = UserDefaults.standard.object(forKey: favKey) as? Data {
            
            return NSKeyedUnarchiver.unarchiveObject(with: unarchivedObject as Data) as? [Video]
        }
        
        return nil
    }
    
    
    static func saveFav(Video : [Video]?) {
        
        let archivedObject = archivePeople(people: Video!)
        UserDefaults.standard.set(archivedObject, forKey: favKey)
        UserDefaults.standard.synchronize()
    }
}
