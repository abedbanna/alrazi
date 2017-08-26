//
//  ArticlesViewController.swift
//  alzari
//
//  Created by AbedMac on 8/26/17.
//  Copyright © 2017 AbedMac. All rights reserved.
//

import UIKit
import FirebaseDatabase
var myArticles:[Article]=[]
class ArticlesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var ref: DatabaseReference?
    var handle:DatabaseHandle?
    
    
    var activityIndicator:UIActivityIndicatorView=UIActivityIndicatorView()
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        activityIndicator.center=self.view.center
        activityIndicator.hidesWhenStopped=true
        activityIndicator.activityIndicatorViewStyle=UIActivityIndicatorViewStyle.gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        
        ref = Database.database().reference()
        
        
        handle=ref?.child("Articles").observe(.childAdded, with: { (snapshot) in
            
            if let item = snapshot.value as? [String : String]
            {
                
                let article = Article(title: item["title"]!, author: item["author"]!, desc: item["desc"]!,url:item["url"]!)
                
                //print (article)
                
                myArticles.append(article)
                // Do any additional setup after loading the view.
               // print("the count is ",myArticles.count)
               
             self.tableview.reloadData()
            }
       
        })
        { (error) in
            print(error.localizedDescription)
        }
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArticles.count
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        let cellIdentifier = "Cell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ArticleTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        cell.lblTitle?.text=myArticles[indexPath.row].Title
        cell.lblAuthor?.text=myArticles[indexPath.row].Author
        //cell.btnFav.tag=indexPath.row
        cell.lblDesc?.text=myArticles[indexPath.row].Desc
        

        
        
        
        activityIndicator.stopAnimating()
        return cell
        
    }

    
    

}
