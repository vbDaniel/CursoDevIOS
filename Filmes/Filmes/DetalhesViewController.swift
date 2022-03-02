//
//  File.swift
//  Movies
//
//  Created by Rethink on 02/03/22.
//

import Foundation
import UIKit

class DetalhesViewController: UIViewController{
    
    @IBOutlet weak var imageDetalhe: UIImageView!
    @IBOutlet weak var titleDetalhe: UILabel!
    @IBOutlet weak var textDetalhe: UILabel!
    
    var movieDetalhe: Movies!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageDetalhe.image = movieDetalhe.image
        titleDetalhe.text = movieDetalhe.title
        textDetalhe.text = movieDetalhe.description
    }
}
