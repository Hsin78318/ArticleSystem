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
    
    
    
    
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
