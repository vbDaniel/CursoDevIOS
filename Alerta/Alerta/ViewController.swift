//
//  ViewController.swift
//  Alerta
//
//  Created by Rethink on 24/02/22.
//

import UIKit

class ViewController: UIViewController {
  
    
    @IBAction func exibirAlerta(_ sender: Any) {
        let alerta = UIAlertController(title: "Adicionar Contato", message: "Deseja adicionar contato", preferredStyle: .alert)
        
        let confirmar = UIAlertAction(title: "Confirmar", style: .default, handler: { UIAlertAction in
            print("Botão Confirmado") // in style da pra usar outros 
        })
        alerta.addAction(confirmar)
        present(alerta, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

