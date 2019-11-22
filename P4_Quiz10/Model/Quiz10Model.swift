//
//  Quiz10Model.swift
//  P4_Quiz10
//
//  Created by Xinxin Liu on 22/11/2019.
//  Copyright © 2019 Xinxin Liu. All rights reserved.
//

import Foundation

struct QuizItem: Codable {
    let id: Int
    let question: String
    let answer: String
    let author: Author?
    let attachment: Attachment?
    let favourite: Bool
    let tips: [String]
    
    struct Author: Codable {
        let isAdmin: Bool?
        let username: String
        let photo: Attachment?
    }
    
    struct Attachment: Codable {
        let filename: String
        let mime: String
        let url: URL?
    }
}

class Quiz10Model {
    
    var quizzes = [QuizItem]()
    
    func download() {
        let TOKEN = "8606ca3284a0e9615d99"
        let surl = "https://quiz.dit.upm.es/api/quizzes/random10wa?token=\(TOKEN)"
        
        guard let url = URL(string: surl) else {
            print("Invalid URL")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            
            //let letra = String(data: data, encoding: .utf8)
            //print(letra)
            
            let decoder = JSONDecoder()
            let quizzes = try decoder.decode([QuizItem].self, from: data)
            
            self.quizzes = quizzes
            
        } catch {
            print("Error while downloading")
        
        }
    }
    
}
