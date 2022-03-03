//
//  TaskTableViewController.swift
//  TaskList
//
//  Created by Rethink on 03/03/22.
//

import UIKit

class TaskTableViewController: UITableViewController {
    
    var tasks: [String] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let task = TaskUserDefault()
        tasks = task.list()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        cell.textLabel?.text = tasks[indexPath.row]
        
        return cell
    }
}
