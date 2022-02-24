//
//  ViewController.swift
//  Pass Data
//
//  Created by Rethink on 22/02/22.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var textField: UITextField!
    //Esse metodo é chamado sempre que uma segue é executada antes mesmo de se trocar de tela
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Com esse identifier só vai exutar em uma segue especifica
        if segue.identifier == "passData"{
            let viewControlerDestino = segue.destination as! DetalheViewController
            viewControlerDestino.textResult = textField.text!
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

