//
//  ViewController2.swift
//  alzari
//
//  Created by AbedMac on 8/11/17.
//  Copyright © 2017 AbedMac. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
class ViewController2: UIViewController {
    
   var ref: DatabaseReference!

    
   @IBOutlet weak var txtData: UITextField!
    
    @IBOutlet weak var txtUrl: UITextField!
    @IBAction func btnSave(_ sender: Any) {
       
  ref = Database.database().reference()
        
        self.ref.child("list").childByAutoId().setValue(["username": txtData.text!,"url": txtUrl.text!])
        
  
        txtData.text=""
        
        
        
         let alertController = UIAlertController(title: "New Record", message:"Has been Added", preferredStyle: UIAlertControllerStyle.alert)
        
        
        let confirmed = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        
        alertController.addAction(confirmed)
        alertController.addAction(cancel)
        self.present(alertController, animated: true, completion: nil)
        
        
    
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
  /*
    let ref=Database().reference()
        ref.child("list").setValue(txtClinicName.text!)
        
        let alertController = UIAlertController(title: "has been added", message:"Message", preferredStyle: UIAlertControllerStyle.alert)
        
        
        let confirmed = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        
        alertController.addAction(confirmed)
        alertController.addAction(cancel)
        self.present(alertController, animated: true, completion: nil)*/
    
 
    
    
    /*
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
