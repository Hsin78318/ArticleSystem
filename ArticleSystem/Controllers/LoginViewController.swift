//
//  LoginViewController.swift
//  ArticleSystem
//
//  Created by Chen Hsin on 2018/6/7.
//  Copyright © 2018年 Chen Hsin. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class LoginViewController: UIViewController {

    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signUp(_ sender: Any) {
        //跳出註冊視窗
        let alert = UIAlertController(title: "註冊新會員",
                                      message: "註冊新會員",
                                      preferredStyle: .alert)
        //儲存註冊資料
        let saveAction = UIAlertAction(title: "儲存", style: .default) { _ in
            
            let emailField = alert.textFields![0]
            let passwordField = alert.textFields![1]
            
            Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!) { uesr, error in
                if error == nil {
                    Auth.auth().signIn(withEmail: self.emailTextField.text!,
                                       password: self.passwordTextField.text!)
                }
            }
        }
        //取消註冊
        let cancelAction = UIAlertAction(title: "取消", style: .cancel)
        
        alert.addTextField { textEmail in
            textEmail.placeholder = "輸入您的電子郵件"
        }
        
        alert.addTextField { textPassword in
            textPassword.placeholder = "輸入您的密碼"
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        //呈現效果
        present(alert, animated: true, completion: nil)
        
        
    }
    
    
    
    
}



