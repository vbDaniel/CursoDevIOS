//
//  movies .swift
//  Movies
//
//  Created by Rethink on 25/02/22.
//

import Foundation
import UIKit

class Movies{
    
    var title: String!
    var description: String!
    var image: UIImage!
    
    
    init(image: UIImage,title: String, description: String){
        self.title = title
        self.description = description
        self.image = image
        
    }
}
