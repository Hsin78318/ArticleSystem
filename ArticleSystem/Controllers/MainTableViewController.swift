//
//  MainTableViewController.swift
//  ArticleSystem
//
//  Created by Chen Hsin on 2018/6/8.
//  Copyright © 2018年 Chen Hsin. All rights reserved.
//

import UIKit
import Firebase



class MainTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var ArticleTableView: UITableView!

    
    var refHandle: UInt!
    var databaseRef: DatabaseReference!
    var storageRef: StorageReference!
    
    var uid = ""
    
    var articleList = [Articles]()
    
    @objc func done()  {
        let stortboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = stortboard.instantiateViewController(withIdentifier: "ArticlesViewController") as! ArticlesViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ArticleTableView.delegate = self
        ArticleTableView.dataSource = self
        
        if let user = Auth.auth().currentUser{
            uid = user.uid
        }
        
        let rightButtonItem = UIBarButtonItem.init(
            title: "新增",
            style: .done,
            target: self,
            action: #selector(done)
        )
        self.navigationItem.rightBarButtonItem = rightButtonItem
        
        databaseRef = Database.database().reference()
        storageRef = Storage.storage().reference()
        
        fetchArticlesList()
    }
    
    func fetchArticlesList(){
        
        
        refHandle = databaseRef.child("Meal").observe(.childAdded, with: { (snapshot) in
            
            if let dictionary = snapshot.value as? [String : AnyObject]{
                print("dictionary is \(dictionary)")
                
                let articleDetail = Articles()
                
                articleDetail.setValuesForKeys(dictionary)
                self.articleList.append(articleDetail)
                
                DispatchQueue.main.async {
                    self.ArticleTableView.reloadData()
                }
                
            }
            
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleList.count
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ArticlesTableViewCell
        
        cell.articleNameLabel.text = articleList[indexPath.row].articleName
        cell.authorNameLabel.text = articleList[indexPath.row].authorName
        cell.publishDateLabel.text = articleList[indexPath.row].publishDate
        cell.articleContent.text = articleList[indexPath.row].content
        
        return cell
    }
}


