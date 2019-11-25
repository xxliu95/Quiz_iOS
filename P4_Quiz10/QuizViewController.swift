//
//  QuizViewController.swift
//  P4_Quiz10
//
//  Created by Xinxin Liu on 22/11/2019.
//  Copyright © 2019 Xinxin Liu. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController, UITextFieldDelegate {

    var quiz: QuizItem!
    var num: Int!
    var counter = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answer: UITextField!
    @IBOutlet weak var attachmentImageView: UIImageView!
    @IBOutlet weak var authorImageView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var questionNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTextFields()
        configureTapGesture()
        questionNumber.text = "Question number \(num ?? 0)"
        questionLabel.text = quiz.question
        attachmentImageView.image = UIImage(named: "none")
        if let url = quiz.attachment?.url {
            attachmentImageView.image = image(url: url)
        }
        authorLabel.text = "Created by \(quiz.author?.username ?? "Anónimo")"
        if let url = quiz.author?.photo?.url {
            authorImageView.image = image(url: url)
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    private func configureTextFields() {
        answer.delegate = self
    }
    
    private func configureTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(QuizViewController.handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap() {
        print("tap tap tap")
        view.endEditing(true)
    }
    
    @IBAction func checkPressed(_ sender: Any) {
        view.endEditing(true)
        checkAnswer()
    }
    
    func checkAnswer(){
        
        if answer.text?.lowercased() == quiz.answer.lowercased() {
            print("Bien")
            self.alert(msg: "Correct Answer!")
        } else {
            print("Mal")
            counter += 1
            
            if counter >= 3 {
                self.alert(msg: "The correct answer was \(quiz.answer)")
                counter = 0
            } else {
                self.alert(msg: "Wrong Answer!")
            }
        }

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        checkAnswer()
        return true
    }

    
    @objc func keyboardWillChange(notification: Notification) {
        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        if notification.name == UIResponder.keyboardWillShowNotification ||
            notification.name == UIResponder.keyboardWillChangeFrameNotification {
            view.frame.origin.y = -keyboardRect.height * 0.9
        } else {
            view.frame.origin.y = 0
        }
    }
}

