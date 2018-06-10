//
//  ArticlesViewController.swift
//  ArticleSystem
//
//  Created by Chen Hsin on 2018/6/8.
//  Copyright © 2018年 Chen Hsin. All rights reserved.
//

import UIKit

import Firebase
import FirebaseDatabase
import FirebaseAuth

class ArticlesViewController: UIViewController {

    @IBOutlet weak var articleNameTextField: UITextField!
    
    @IBOutlet weak var authorNameTextField: UITextField!
    
    @IBOutlet weak var publishDateTextField: UITextField!
    
    @IBOutlet weak var articleContentTextField: UITextView!
    
    var uid = ""
    let uniqueString = NSUUID().uuidString //?
    
    
    @IBAction func confirm(_ sender: Any){
        if articleNameTextField.text != "" && authorNameTextField.text != "" && publishDateTextField.text != "" &&
            articleContentTextField.text != ""{
            
            Database.database().reference(withPath: "Article/\(self.uniqueString)").child("articleName").setValue(articleNameTextField.text!)
            Database.database().reference(withPath: "Article/\(self.uniqueString)").child("authorName").setValue(authorNameTextField.text!)
            Database.database().reference(withPath: "Article/\(self.uniqueString)").child("publishDate").setValue(publishDateTextField.text!)
            Database.database().reference(withPath: "Article/\(self.uniqueString)").child("articleContent").setValue(articleContentTextField.text!)
            done()
        }
    }
    
    func done(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "MainNavigation") as! UINavigationController
        self.present(nextViewController, animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        if let user = Auth.auth().currentUser {
            uid = user.uid
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
