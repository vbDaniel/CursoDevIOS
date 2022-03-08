//
//  ViewController.swift
//  Trips
//
//  Created by Rethink on 07/03/22.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    var localManager = CLLocationManager()
    var travel: Dictionary <String, String> = [:]
    var selectIndice: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        if let indice = selectIndice{
            if indice == -1{//add
                localManagerConfigure()
            }
            else{//list
                showNote(travel: travel)
            }
        }
       
        
        let recallPress = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.marcar(gesture:)))
        recallPress.minimumPressDuration = 2
        
        map.addGestureRecognizer(recallPress)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let localizacao = locations.last!
        showLocal(latitude: localizacao.coordinate.latitude, longitude: localizacao.coordinate.longitude)
    }
    //EXIBE A NOTE COM O VALOR DO ENDEREÇO
    func showNote(travel: Dictionary <String, String>){
        if let localTravel = travel["local"]{
            if let latitudeS = travel["latitude"]{
                if let longitudeS = travel["longitude"]{
                    if let latitude = Double(latitudeS){
                        if let longitude = Double(longitudeS){
                           
                            //ADD ANOTACAO
                            let note = MKPointAnnotation()
                            note.coordinate.latitude = latitude
                            note.coordinate.longitude = longitude
                            note.title = localTravel
                            note.subtitle = "I'm here"
                            
                            self.map.addAnnotation(note)
                            
                            showLocal(latitude: latitude, longitude: longitude)
                        }
                    }
                }
            }
        }
            
    }
    func showLocal(latitude: Double, longitude: Double){
        //Exibe Local
        let center = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region: MKCoordinateRegion = MKCoordinateRegion(center: center , span: span)
        self.map.setRegion(region, animated: true)
    }
    @objc func marcar(gesture: UIGestureRecognizer){
        if gesture.state == UIGestureRecognizer.State.began{
            // Recupera a coordenada dos pontos selecionados
            let selectPoint = gesture.location(in: self.map)
            let coordenadas = map.convert(selectPoint, toCoordinateFrom: self.map)
            let local = CLLocation(latitude: coordenadas.latitude, longitude: coordenadas.longitude)
            //recupera endereço do ponto
            
            var localComplete = "Endereço não encontrado!"
            CLGeocoder().reverseGeocodeLocation(local) { (local, erro) in
                if erro == nil{
                    if let localData = local?.first{
                        
                        if let name = localData.name{
                            localComplete = name
                        }
                        else{
                            if let adress = localData.thoroughfare{
                                localComplete = adress
                            }
                        }
                    }
                    //Salvar dados em um Dictionary <String, String>
                    self.travel = ["local": localComplete, "latitude": String(coordenadas.latitude), "longitude": String(coordenadas.longitude)]
                    DataStore().saveTravel(travel: self.travel)
                    print(DataStore().listTrips())
                    
                    //Mostra uma anotaçao ao selecionar
                    let note = MKPointAnnotation()
                    note.coordinate.latitude = coordenadas.latitude
                    note.coordinate.longitude = coordenadas.longitude
                    note.title = localComplete
                    note.subtitle = "I'm here"
                    
                    self.map.addAnnotation(note)
                }
                else{
                    print(" erro ")
                }
            }
            
           
            
        }
    }
    func localManagerConfigure() {
        localManager.delegate = self
        localManager.desiredAccuracy = kCLLocationAccuracyBest
        localManager.requestWhenInUseAuthorization()
        localManager.startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status != .authorizedWhenInUse{
            let alertController = UIAlertController(title: "Permissão de local", message: "Necessario autorização da localizaçao para funcionamento correto do App", preferredStyle: .alert)
            let actionConfig = UIAlertAction(title: " Abrir Configurações", style: .default) { (alertConfig) in
                if let config = NSURL(string: UIApplication.openSettingsURLString){
                    UIApplication.shared.open(config as URL)
                }
            }
            let actionCancel = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
            
            alertController.addAction(actionConfig)
            alertController.addAction(actionCancel)
            
            present(alertController, animated: true, completion: nil)
        }
    }
}

