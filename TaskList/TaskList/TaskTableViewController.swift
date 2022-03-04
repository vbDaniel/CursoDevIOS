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
        
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            let task = TaskUserDefault()
            task.remove(indice: indexPath.row)
            updateList()
        }
    }
    
    func updateList(){
        let task = TaskUserDefault()
        tasks = task.list()
        tableView.reloadData()
    }
    override func viewDidAppear(_ animated: Bool) {
        let task = TaskUserDefault()
        tasks = task.list()
        tableView.reloadData()
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
