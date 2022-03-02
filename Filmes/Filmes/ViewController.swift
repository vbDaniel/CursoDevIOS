//
//  ViewController.swift
//  Filmes
//
//  Created by Rethink on 25/02/22.
//

import UIKit

class ViewController: UITableViewController {
    
    var arrayMovies: [Movies] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        var movies: Movies
        
        var image = UIImage(named: "filme1")
        movies = Movies(image: image!, title: "007", description: "Descriçao 1")
        arrayMovies.append(movies)
        
        image = UIImage(named: "filme2")
        movies = Movies(image: image!,title: "Star Wars", description: "Descriçao 2")
        arrayMovies.append(movies)
        
        image = UIImage(named: "filme3")
        movies = Movies(image: image!,title: "Impacto Mortal", description: "Descriçao 3")
        arrayMovies.append(movies)
        
        image = UIImage(named: "filme4")
        movies = Movies(image: image!,title: "Deadpool", description: "Descriçao 4")
        arrayMovies.append(movies)
        
        image = UIImage(named: "filme5")
        movies = Movies(image: image!,title: "O Regresso", description: "Descriçao 5")
        arrayMovies.append(movies)
        
        image = UIImage(named: "filme6")
        movies = Movies(image: image!,title: "A herdeira", description: "Descriçao 6")
        arrayMovies.append(movies)
        
        image = UIImage(named: "filme7")
        movies = Movies(image: image!,title: "Caçadores", description: "Descriçao 7")
        arrayMovies.append(movies)
        
        image = UIImage(named: "filme8")
        movies = Movies(image: image!,title: "Regresso do Mal", description: "Descriçao 8")
        arrayMovies.append(movies)
        
        image = UIImage(named: "filme9")
        movies = Movies(image: image!,title: "Tarzan", description: "Descriçao 9")
        arrayMovies.append(movies)
        
        image = UIImage(named: "filme10")
        movies = Movies(image: image!,title: "HardCore", description: "Descriçao 10")
        arrayMovies.append(movies)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayMovies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        let movie = arrayMovies[indexPath.row]
        let celulaReuso = "celulaReuso"
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath) as! MovieCelula
        
        celula.movieImage.image = movie.image
        celula.movieDescription.text = movie.description
        celula.movietitle.text = movie.title
        //ARREDONDAMENTO
        //celula.movieImage.layer.cornerRadius = 42
        //celula.movieImage.clipsToBounds = true
        //tem que ser a exata metade do tamanho da img
       
        
        
        
        return celula
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueDetalhe"{
            if let indexPath = tableView.indexPathForSelectedRow{
                let movie = self.arrayMovies[indexPath.row]
                let viewControllerDestino = segue.destination as! DetalhesViewController
                viewControllerDestino.movieDetalhe = movie
            }
        }
    }
    
}

