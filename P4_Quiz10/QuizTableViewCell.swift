//
//  QuizTableViewCell.swift
//  P4_Quiz10
//
//  Created by Xinxin Liu on 23/11/2019.
//  Copyright © 2019 Xinxin Liu. All rights reserved.
//

import UIKit

class QuizTableViewCell: UITableViewCell {

    @IBOutlet weak var quest: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var authorImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
