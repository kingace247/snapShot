//
//  Sign In ViewController.swift
//  Snap shot
//
//  Created by David Garza on 4/30/17.
//  Copyright © 2017 David Garza. All rights reserved.
//

import UIKit
import CoreData
import Firebase

class SignInViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func SignUpTapped(_ sender: Any) {
        
        
        FIRAuth.auth()?.signIn(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in
            
            print("We tried to sign in ")
            if error != nil {
                print("Hey we have an error:\(error)")
                
                FIRAuth.auth()?.createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in
                    print("we tried to create User")
                    
                    if error != nil {
                        print("We have an error:\(error)")
                    }else{
                        print("Created User successfully!")
                        self.performSegue(withIdentifier: "signInsegue", sender: nil)
                    }
                })
                
            }else{
                print("Signed in successfully")
                self.performSegue(withIdentifier: "signInsegue", sender: nil)
                
            }
        })
        
    }
    
    
}

