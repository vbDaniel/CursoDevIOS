//
//  ViewController.swift
//  Signos
//
//  Created by Rethink on 25/02/22.
//

import UIKit

class ViewController: UITableViewController {
    
    let signos: [String] = ["Áries","Touro","Gêmeos","Câncer","Leão","Virgem","Libra","Escorpião","Sargitário","Capricórnio","Aquário","Peixes"]
     var significados: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        significados.append("Uma pessoa cheia de energia e entusiasmo . Pioneiro e aventureiro, lhe encantam as metas, a libertade e as ideias novas")
        significados.append("Zeloso e possesivo, inflexivel e ressentido. As vezes pecam em ser cobiçosos e de permitir-se tudo")
        significados.append("3 ...")
        significados.append("4 ...")
        significados.append("5 ...")
        significados.append("6 ...")
        significados.append("7 ...")
        significados.append("8 ...")
        significados.append("9 ...")
        significados.append("10 ...")
        significados.append("11 ...")
        significados.append("12 ...")
        
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return signos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celulaReuso = "celulaReuso"
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath)
        celula.textLabel?.text = signos[indexPath.row]
        return celula
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let alertController = UIAlertController(title: "Significado do signo", message: significados[indexPath.row], preferredStyle:.alert)
        
        let confirmar = UIAlertAction(title: "ok", style: .default, handler: nil)
        alertController.addAction(confirmar)
        present(alertController, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        
        
    }
}

