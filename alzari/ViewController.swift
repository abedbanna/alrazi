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
import TransitionButton

class ViewController: UIViewController {

    @IBOutlet weak var btnStack: UIStackView!
    @IBOutlet weak var innerStack: UIStackView!
    @IBOutlet weak var stack: UIStackView!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var btn_stack: UIStackView!
    
    
    let newViewController = UITableViewController()
    
    let button = TransitionButton(frame: CGRect(x: 100, y: 100, width: 100, height: 40)) // please use Autolayout in real project

    
    
    
 func loginOP(_ sender: Any) {
        
        if txtPassword.text != ""  && txtUsername.text != ""
        {
            
            
                Auth.auth().signIn(withEmail: txtUsername.text!, password: txtPassword.text!, completion: { (user,error) in
                    
                    if user != nil
                    {
                        print(user?.displayName ??  "abed")
                        
                        self.performSegue(withIdentifier: "segue", sender: self)
                        
                        
                    }
                    else
                    {
                        print(error?.localizedDescription ??  "error Message")
                        
                    }
                    
                })
           /*
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
            
        }//end segment*/
            
        }
            
            
        else{
            
        }
        
    }

    
    
    
    
    @IBAction func buttonAction(_ button: TransitionButton) {
        button.startAnimation() // 2: Then start the animation when the user tap the button
        let qualityOfServiceClass = DispatchQoS.QoSClass.background
        let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
        backgroundQueue.async(execute: {
            
            sleep(3) // 3: Do your networking task or background work here.
            
            DispatchQueue.main.async(execute: { () -> Void in
               
                button.stopAnimation(animationStyle: .expand, completion: {
                   
                    
                    self.loginOP(button)
                    
                    
                    
                    
                })
            })
        })
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
        btn_stack.axis = .horizontal
        btn_stack.alignment = .firstBaseline
        btn_stack.distribution = .fill
        btn_stack.spacing = 18
        
        button.backgroundColor = UIColor(hue: 0.0583, saturation: 0.42, brightness: 0.52, alpha: 1.0) /* #85604c */
        button.setTitle("Login", for: .normal)
        button.cornerRadius = 20
        button.spinnerColor = .white
        button.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
       
          self.btn_stack.addArrangedSubview(button)
   
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

