//
//  QuizzesTableViewController.swift
//  P4_Quiz10
//
//  Created by Xinxin Liu on 22/11/2019.
//  Copyright © 2019 Xinxin Liu. All rights reserved.
//

import UIKit

class QuizzesTableViewController: UITableViewController {

    var quiz10Model = Quiz10Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        quiz10Model.download()
        tableView.reloadData()
    }

    @IBSegueAction func showQuizDetails(_ coder: NSCoder) -> QuizViewController? {
        
        let qvc = QuizViewController(coder: coder)!
        let row = tableView.indexPathForSelectedRow!.row
        qvc.quiz = quiz10Model.quizzes[row]
        
        return qvc
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quiz10Model.quizzes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Quiz Cell", for: indexPath)

        let row = indexPath.row
        let quiz = quiz10Model.quizzes[row]
        
        cell.textLabel?.text = quiz.question
        cell.detailTextLabel?.text = quiz.author?.username ?? "Anónimo"
        cell.imageView?.image = UIImage(named: "none") // es bueno poner una imagen por defecto y luego cambiarlo
        
        if let url = quiz.attachment?.url {
            let img = image(url: url)
            cell.imageView?.image = img
        }
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
