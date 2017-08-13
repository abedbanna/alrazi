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

class ViewController1: UIViewController ,UITableViewDelegate,UITableViewDataSource{
 var ref: DatabaseReference?
    var handle:DatabaseHandle?
    
    @IBOutlet weak var tableView: UITableView!
    var myList:[String]=[]
    var myPath:[String]=[]
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    ref = Database.database().reference()
    
    handle=ref?.child("list").observe(.childAdded, with: { (snapshot) in
        
        if let item = snapshot.value as? [String : String]
        {
    
          // print(item["url"] ?? "ee")
            self.myList.append(item["username"]!)
             self.myPath.append(item["url"]!)
            
           self.tableView.reloadData()
        }
        
        
    }) { (error) in
        print(error.localizedDescription)
    }
    
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       //let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        let cellIdentifier = "Cell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
       cell.videoTitle?.text=myList[indexPath.row]
        
        let url = URL(string: myPath[indexPath.row])
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
     cell.img.image = UIImage(data: data!)
        
        
        
        return cell
        
    }

}
