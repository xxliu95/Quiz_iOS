//
//  QuizViewController.swift
//  P4_Quiz10
//
//  Created by Xinxin Liu on 22/11/2019.
//  Copyright © 2019 Xinxin Liu. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    var quiz: QuizItem!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answer: UITextField!
    @IBOutlet weak var attachmentImageView: UIImageView!
    @IBOutlet weak var authorImageView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = quiz.question
        attachmentImageView.image = UIImage(named: "none")
        if let url = quiz.attachment?.url {
            attachmentImageView.image = image(url: url)
        }
        authorLabel.text = "Created by \(quiz.author?.username ?? "Anónimo")"
        if let url = quiz.author?.photo?.url {
            authorImageView.image = image(url: url)
        }        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
