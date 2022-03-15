//
//  ViewController.swift
//  CoreData
//
//  Created by Rethink on 09/03/22.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext // tbm funciona
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
    
        // Cria entidade IMPORTANTE
        //let usuario = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
        context.fetch(User.fetchRequest())
        //cria um objeto
        let newUser = User()
        // alimenta / Configuraçao de Objetos
        newUser.name = "Daniel Vidal"
        newUser.email = "danielvidalbicalho15@gmail.com"
        
        //Save data ---> atenção o try! é apenas para testes pois é necessario fazer o catch corretamente pois o User precisa saber se seus dados foram salvos ou nao
        do{
            context.save()
        }
        catch{
            print("erro")
        }
        
        
        
        
    }


}

