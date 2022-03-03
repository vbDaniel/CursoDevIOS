//
//  ViewController.swift
//  Anotacoes
//
//  Created by Rethink on 02/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextView!
    let key = "userNote"
    
    @IBAction func buttonSave(_ sender: Any) {
        if let text = textField.text{
            UserDefaults.standard.set(text, forKey: key)
        }
        
    }
    
    func recuperaNote() -> String{
        if let textRecover = UserDefaults.standard.object(forKey: key){
            return textRecover as! String
        }
        return ""
    }
    
    //Esconde a barra de Status 
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    //Oculta o teclado ao clicar na tela
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Press")
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        textField.text = recuperaNote()
        
    }

  
     
}

