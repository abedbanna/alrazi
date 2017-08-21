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
import FirebaseStorage
var myList:[Video]=[]
 var viewed:[String]=[]
class ViewController1: UIViewController ,UITableViewDelegate,UITableViewDataSource{
 
    
    var ref: DatabaseReference?
    var handle:DatabaseHandle?
    var storageRef:StorageReference?
    var activityIndicator:UIActivityIndicatorView=UIActivityIndicatorView()
    
   
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewWillAppear(_ animated: Bool) {
       
      
        
        if UserDefaults.standard.object(forKey: "fav_list") != nil
        {
            myFav=ArchiveUtil.loadFav()!
           
        }
      
        
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let wifi=myWifi()
       
        
        
        if wifi.isInternetAvailable()
        {
        activityIndicator.center=self.view.center
        activityIndicator.hidesWhenStopped=true
        activityIndicator.activityIndicatorViewStyle=UIActivityIndicatorViewStyle.gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    
    ref = Database.database().reference()
         storageRef=Storage.storage().reference()
    
    handle=ref?.child("list").observe(.childAdded, with: { (snapshot) in
        
        if let item = snapshot.value as? [String : String]
        {
            
            let video = Video(title: item["title"]!, author: item["author"]!, youtube: item["youtube"]!,url:item["url"]!)
           
            
            
             myList.append(video)
            // Do any additional setup after loading the view.
            
            if UserDefaults.standard.object(forKey: "fav_list") != nil
            {
                myFav=ArchiveUtil.loadFav()!
                // self.tableView.reloadData()
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
    
    
    var rendared:[String]=[]
    
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
       
        
        for  fav in myFav
        {
        
            if fav.Title.isEqual( myList[indexPath.row].Title) && !viewed.contains(myList[indexPath.row].Title)
            {
       
            cell.btnFav.isHidden = true
            viewed.append(myList[indexPath.row].Title)
           
           }
        
        
            

        }
        if myFav.count==0
        { cell.btnFav.isHidden = false}
        
        if !rendared.contains(myList[indexPath.row].Title)
        {
        
        
        
        Storage.storage().reference(forURL: myList[indexPath.row].URL).getData(maxSize: 10 * 1024 * 1024, completion: { (data, error) in
            DispatchQueue.main.async() {
        
                cell.img.image = UIImage(data: data!)
                myList[indexPath.row].Image=cell.img.image!
               
            }
        })
            
            rendared.append(myList[indexPath.row].Title)
        }
            
        

        
        activityIndicator.stopAnimating()
        return cell
        
    }
    
  
    

}
