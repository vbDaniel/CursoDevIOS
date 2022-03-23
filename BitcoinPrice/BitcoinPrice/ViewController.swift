//
//  ViewController.swift
//  BitcoinPrice
//
//  Created by Rethink on 22/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var updateButton: UIButton!
    //
    //CONSUMINDO SERVIÇO DA WEB
    //
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.recoverBitcoinPrice()
    }
    func formaterPrice(price: NSNumber) -> String{
        let nf = NumberFormatter()
        
        nf.numberStyle = .decimal
        nf.locale = Locale(identifier: "pt_BR")
        
        if let finalPrice = nf.string(from: price){
            return finalPrice
        }
        return "0,00"
    }
    
    func recoverBitcoinPrice(){
        
        self.updateButton.setTitle("ATUALIZANDO...", for: .normal)
        
        if let url = URL(string: "https://www.mercadobitcoin.net/api/BTC/ticker/"){//API URL
            let task = URLSession.shared.dataTask(with: url) { (data, request, erro) in
                if erro == nil{
                    
                    if let returnData = data{
                        do {
                            if let objectJSON = try JSONSerialization.jsonObject(with: returnData, options: []) as? [String: Any]{
                                if let ticker = objectJSON["ticker"] as? [String: Any]{
                                    if let price = Double(ticker["buy"] as! Substring){
                                        let formaterPrice = self.formaterPrice(price: NSNumber(value: price))
                                        
                                        DispatchQueue.main.async {
                                            self.priceLabel.text = "R$ \(formaterPrice)"
                                            self.updateButton.setTitle("ATUALIZAR VALOR", for: .normal)
                                        }
                                       
                                    }
                                }
                            }
                           
                        } catch  {
                            print("error")
                        }
                    }
                    //print("Sucesso ao retornar os valores da API")
                }else{
                    print("Falha ao retornar os valores da API")
                }
            }
            
            task.resume()
        }
    }
    @IBAction func updateValue(_ sender: Any) {
        self.recoverBitcoinPrice()
    }
    

}

