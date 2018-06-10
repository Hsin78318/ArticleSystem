//
//  ArticlesTableViewCell.swift
//  ArticleSystem
//
//  Created by Chen Hsin on 2018/6/8.
//  Copyright © 2018年 Chen Hsin. All rights reserved.
//

import UIKit

class ArticlesTableViewCell: UITableViewCell {

    
    @IBOutlet weak var articleNameLabel: UILabel!
    
    @IBOutlet weak var authorNameLabel: UILabel!
    
    @IBOutlet weak var publishDateLabel: UILabel!
    
    @IBOutlet weak var articleContent: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
