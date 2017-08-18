//
//  FavController.swift
//  alzari
//
//  Created by AbedMac on 8/18/17.
//  Copyright © 2017 AbedMac. All rights reserved.
//

import UIKit

class FavController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if UserDefaults.standard.object(forKey: "fav_list") != nil
        {
            myFav=ArchiveUtil.loadFav()!
             self.tableView.reloadData()
        }
        
       
    }
    override func viewWillAppear(_ animated: Bool) {
        if UserDefaults.standard.object(forKey: "fav_list") != nil
        {
            myFav=ArchiveUtil.loadFav()!
            self.tableView.reloadData()
        }
        
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
        return myFav.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "Cell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? FavTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
       cell.lblAuthor?.text=myFav[indexPath.row].Author
        // cell.lblTitle?.text=myFav[indexPath.row].Title
     cell.lblTitle?.text=myFav[indexPath.row].Title
        
        
        cell.img.image=myFav[indexPath.row].Image
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle==UITableViewCellEditingStyle.delete
        {
            myFav.remove(at: indexPath.row)
             ArchiveUtil.saveFav(Video: myFav)
            self.tableView.reloadData()
        
        }
    }
}
