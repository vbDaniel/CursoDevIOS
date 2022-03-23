//
//  ViewController.swift
//  FirebaseConfig
//
//  Created by Rethink on 23/03/22.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class ViewController: UIViewController {
    
    let firebase = Database.database().reference()
    
    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // salvar no banco de dados
        
        
        //let name = firebase.child("pontuacao").child("001").child("name")
        
        //points.removeValue()
        //points.child("001").child("name").setValue("Daniel")
        
        
        // Recuperar do Data base(CRIAR UM listener == observe)
//
//        name.observe(DataEventType.value, with: {(data) in
//            print("novos dados \(data)")
//            let myName = data.value as! String
//            self.infoLabel.text = myName
//        })
        
        // LOGIN EMAIL E SENHA
        
//        Auth.auth().createUser(withEmail: "daniel@gmail.com", password: "senha123") { (user, erro) in
//
//            if erro == nil{
//                //sucesso
//                print("User cadastrado!")
//            }else{
//                //erro
//                print("erro mano aqui:\(String(describing: erro?.localizedDescription))")
//            }
//        }
        
        // Login  e Logout dos USUARIOS
        
//        do {
//            try  Auth.auth().signOut()
//        } catch  {
//            print("erro em logout")
//        }
        
        //login
        
        Auth.auth().signIn(withEmail: "daniel@gmail.com", password: "senha123")  { (user, erro) in
            if erro == nil{
                print("Usuario está logado")
            }else{
                print("Usuario não está logado, erro: \(String(describing: erro?.localizedDescription))")
            }

        }
        
        // VERIFICAR SE O USER JÁ TA LOGADO OU NAO
//
//        Auth.auth().addStateDidChangeListener { (auth, user) in
//            if let logUser = user{
//                print("Usuario está logado \(String(describing: logUser.email))")
//            }else{
//                print("Usuario não está logado")
//            }
//
//        }
        
        
    }
}

 
