//
//  ViewController.swift
//  CaraOuCoroaApp6
//
//  Created by Rethink on 23/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "jogarMoeda"{
            let viewControllerDestine = segue.destination as! DetalheViewController
            viewControllerDestine.randomNumber = Int(arc4random_uniform(2))
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

