//
//  ViewController.swift
//  CoreData2.0
//
//  Created by Rethink on 10/03/22.
//

import UIKit
import CoreData

class ViewController: UIViewController {

   
    @IBOutlet weak var textLabel: UILabel!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var users: [Person]?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
       
        let newPerson = Person(context: self.context)
        
//        newPerson.name = "Rose Vidal"
//        newPerson.email = "amandavidalbicalho15@gmail.com"
//        newPerson.age = 26
       
        
        
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
        
        //Order
        let sortOrderAZ = NSSortDescriptor(key: "name", ascending: true)
        
        //Filtro
        let predicate = NSPredicate(format: "name == %@", "Daniel Vidal")
        // let predicate = NSPredicate(format: "name contains %@", "exemplo") // aqui ele vai pegar oque tiver dentro do exemplo e se conter em algum lugar vai filtrar
        // let predicate = NSPredicate(format: "name contains [c] %@", "exemplo") // ele vai ignorar com o [c] as letras maiusculas e minusculas
    
        // let predicate = NSPredicate(format: "name beginswith %@", "exemplo") // aqui oq ele aparece no inicio
        // let predicate = NSPredicate(format: "name beginswith [c] %@", "exemplo") // aqui oq ele aparece no inicio
        
        
        //aplicar filtro de order
        requisicao.sortDescriptors = [sortOrderAZ]
        requisicao.predicate = predicate
        print(".......")
        
        
        fetchPeople()
     
        
        print(newPerson)
        
        do{
            try context.save()
            print("SALVOU CERTIN")
        }
        catch{
            print("nao salvou mano sorry ai")
        }
        
        
    }
     
  
    
//    let newUser = NSEntityDescription.insertNewObject(forEntityName: "Person", into: context )
//    newUser.setValue("DanielVidal", forKey: "name")
   
    
    func order(){
        
    }

    func fetchPeople(){
        do{
            self.users = try context.fetch(Person.fetchRequest())
            if users!.count > 0 {
                for user in users! {
                    if let userName = user.value(forKey: "name"){
                        if let userAge = user.value(forKey: "age"){
                            if let userEmail = user.value(forKey: "email"){
                               
                                // print(String(userName as! Character) + " tem " + String(userAge as! Character) + " anos de idade,seu email é : " + String(userEmail as! Character));
                                context.delete(user)
                                do{
                                    try context.save()
                                    //print("SALVOU CERTIN")
                                }
                                catch{
                                    print("nao salvou mano sorry ai")
                                }
                                print("Name: \(userName)")
//                                print("Age: \(userAge)")
//                                print("Email: \(userEmail)")
                            }
                        }
                    }
                 
                }
            }else{
                print("Não foi encontrado nenhum usuario")
            }
        }
        catch{
            print("ERRO é isso")
        }
    }
    
   
}

