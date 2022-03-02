//
//  DetalheViewController.swift
//  CaraOuCoroaApp6
//
//  Created by Rethink on 24/02/22.
//

import UIKit


class DetalheViewController: UIViewController {

    
    @IBOutlet weak var moedaImage: UIImageView!
    
    var randomNumber: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        if randomNumber == 0{
            //cara
            moedaImage.image = UIImage(named: "moeda_cara")
            
        }
        else if randomNumber == 1{
            //cor
            moedaImage.image = UIImage(named: "moeda_coroa")
        }
        // Do any additional setup after loading the view.
    }

}
