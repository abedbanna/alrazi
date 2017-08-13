//
//  ViewController.swift
//  alzari
//
//  Created by AbedMac on 8/11/17.
//  Copyright © 2017 AbedMac. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class ViewController: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var mySegement: UISegmentedControl!
    
    let newViewController = UITableViewController()
   
    
    @IBAction func btnLogin(_ sender: Any) {
   
 if txtPassword.text != ""  && txtUsername.text != ""
 {
    
    print(mySegement.selectedSegmentIndex)
 if mySegement.selectedSegmentIndex==0
 {
            Auth.auth().signIn(withEmail: txtUsername.text!, password: txtPassword.text!, completion: { (user,error) in
                
                if user != nil
                {
                    print(user?.displayName ??  "abed")
                    
                     self.performSegue(withIdentifier: "segue", sender: self)
                    
                    
                }
                else
                {
                print(error?.localizedDescription ??  "karee")
                
                }
                
            })
        }
    
    else
 {
    Auth.auth().createUser(withEmail: txtUsername.text!, password: txtPassword.text!, completion: { (user, error) in
        
        
        if user != nil
        {
            print(user?.displayName ??  "abed")
            
            
            
        }
        else
        {
            print(error?.localizedDescription ??  "karee")
            
        }
        
        
    })
    
    }
    
    }//end segment
        
 else{
   
        }
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

