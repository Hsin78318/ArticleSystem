//
//  InitialViewController.swift
//  ArticleSystem
//
//  Created by Chen Hsin on 2018/6/8.
//  Copyright © 2018年 Chen Hsin. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase


class InitialViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    var uid = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let user = Auth.auth().currentUser {
            uid = user.uid
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func signUp(_ sender: Any) {
        if self.emailTextField.text != "" || self.passwordTextField.text != "" {
            
            Auth.auth().createUser(
                withEmail: self.emailTextField.text!,
                password: self.passwordTextField.text!,
                completion: { (user, error) in
                
                if error == nil {
                    if let user = Auth.auth().currentUser {
                        
                        self.uid = user.uid
                        
                    }
                    
                    Database.database().reference(withPath: "ID/\(self.uid)/profile/Safety-Check").setValue("ON")
                    Database.database().reference(withPath: "Online-Status/\(self.uid)").setValue("ON")
                    
                    self.doneSignUp()
                }
            })
        }
    }
    
    func doneSignUp(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.present(nextViewController, animated: true, completion: nil)
        
        
    }

}
