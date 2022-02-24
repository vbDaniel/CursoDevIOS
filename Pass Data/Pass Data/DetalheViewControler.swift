//
//  DetalheViewControlerViewController.swift
//  Pass Data
//
//  Created by Rethink on 23/02/22.
//

import UIKit

class DetalheViewController: UIViewController {

    @IBOutlet weak var resultado: UILabel!
    
    var textResult: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultado.text = textResult
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
