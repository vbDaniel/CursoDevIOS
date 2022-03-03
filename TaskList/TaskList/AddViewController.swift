//
//  AddViewController.swift
//  TaskList
//
//  Created by Rethink on 03/03/22.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var addField: UITextField!
    
    
    @IBAction func addTask(_ sender: Any) {
        if let taskText = addField.text{
        
            let task = TaskUserDefault()
            task.save(task: taskText)
            addField.text = ""
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
