//
//  ViewController1.swift
//  alzari
//
//  Created by AbedMac on 8/11/17.
//  Copyright © 2017 AbedMac. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

var myList:[Video]=[]
 var viewed:[String]=[]
class ViewController1: UIViewController ,UITableViewDelegate,UITableViewDataSource{
 
    
    var ref: DatabaseReference?
    var handle:DatabaseHandle?
  
    var activityIndicator:UIActivityIndicatorView=UIActivityIndicatorView()
    
   
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var barItem: UITabBarItem!
    
    override func viewWillAppear(_ animated: Bool) {
       
      
        
        if UserDefaults.standard.object(forKey: "fav_list") != nil
        {
            myFav=ArchiveUtil.loadFav()!
            
            
         
        }
      
        
        for item in myList
            
        {
        item.inFav=false
        
        }
        for item in myList
            
        {
            for fav in myFav
            {
                if fav.Title==item.Title
                {item.inFav=true
                    break
                }
                
                
            }
            
            
        }//end item loop
        
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let wifi=myWifi()
       
        UITabBar.appearance().tintColor = UIColor(red: 45/255, green: 137/255, blue: 198/255, alpha: 1.0) /* #2d89c6 */
        
        if wifi.isInternetAvailable()
        {
        activityIndicator.center=self.view.center
        activityIndicator.hidesWhenStopped=true
        activityIndicator.activityIndicatorViewStyle=UIActivityIndicatorViewStyle.gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    
    ref = Database.database().reference()
    
    
    handle=ref?.child("list").observe(.childAdded, with: { (snapshot) in
        
        if let item = snapshot.value as? [String : String]
        {
            
            let video = Video(title: item["title"]!, author: item["author"]!, youtube: item["youtube"]!,url:item["url"]!)
           
            
            
             myList.append(video)
            // Do any additional setup after loading the view.
            
            if UserDefaults.standard.object(forKey: "fav_list") != nil
            {
                myFav=ArchiveUtil.loadFav()!
                
                
                for item in myList
                
                {
                for fav in myFav
                {
                if fav.Title==item.Title
                {item.inFav=true
                   break
                    }
               
                
                }
                
                
                }//end item loop
                
            }
            
           
           self.tableView.reloadData()
           
        }
        
        
    }) { (error) in
        print(error.localizedDescription)
    }
    
        // Do any additional setup after loading the view.
    }//end wifi connection checker 
        
        
        else
        {
        
            
            let alertController = UIAlertController(title: "Internet Connection", message:"No Internet", preferredStyle: UIAlertControllerStyle.alert)
            
            
            let confirmed = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
            let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
            
            alertController.addAction(confirmed)
            alertController.addAction(cancel)
            self.present(alertController, animated: true, completion: nil)
            
            
        }
        
       
    
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 
    
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myList.count
    }
    
    
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       //let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        let cellIdentifier = "Cell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        cell.videoTitle?.text=myList[indexPath.row].Title
        cell.lblAuthor?.text=myList[indexPath.row].Author
        cell.btnFav.tag=indexPath.row
        cell.btnShow.tag=indexPath.row
       
        
     
       if  myList[indexPath.row].inFav
       { cell.btnFav.isHidden = true}
        else
       {
        cell.btnFav.isHidden = false
        }
        
        
        
        
      
    //image load will be here
        
       cell.img.loadImageWithCashe(urlString: myList[indexPath.row].URL,index: indexPath.row)
    
        
        

        
        activityIndicator.stopAnimating()
        return cell
        
    }
    
  
    

}
