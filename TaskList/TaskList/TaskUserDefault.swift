//
//  TaskUserDefalt.swift
//  TaskList
//
//  Created by Rethink on 03/03/22.
//

import UIKit


class TaskUserDefault{
    
    let key = "listTask"
    var tasks: [String] = []
    
    func remove(indice: Int){
        
        tasks = list()
        tasks.remove(at: indice)
        UserDefaults.standard.set(tasks, forKey: key)
    }
    func save(task: String){
        
        tasks = list()
        tasks.append(task)
        UserDefaults.standard.set(tasks, forKey: key)
    }
    
    func list() -> Array<String>{
        let datas = UserDefaults.standard.object(forKey: key)
        if datas != nil{
            return datas as! Array<String>
        }
        else{
        return []
        }
    }
}

