//
//  ViewController.swift
//  Where am I
//
//  Created by Rethink on 07/03/22.
//

import UIKit
import MapKit
class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{

    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var latitudeValor: UILabel!
    @IBOutlet weak var longitudeValor: UILabel!
    @IBOutlet weak var adress: UILabel!
    @IBOutlet weak var speed: UILabel!
    
    
    var localManager = CLLocationManager()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        localManager.delegate = self
        localManager.desiredAccuracy = kCLLocationAccuracyBest
        localManager.requestWhenInUseAuthorization()
        localManager.startUpdatingLocation()

    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation = locations.last
        
        let latitude = userLocation?.coordinate.latitude
        latitudeValor.text = String(latitude!)
        let longitude = userLocation?.coordinate.longitude
        longitudeValor.text =  String(longitude!)

        let userSpeed = userLocation?.speed
        if userSpeed! > 0{
            speed.text = String(userSpeed!)
        }
       
        
        let deltaLatitude: CLLocationDegrees = 0.01
        let deltaLongitude: CLLocationDegrees = 0.01
        let localCenter: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
        let displayArea: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: deltaLatitude, longitudeDelta: deltaLongitude)
        
        let region : MKCoordinateRegion = MKCoordinateRegion(center: localCenter, span: displayArea)
        map.setRegion(region, animated: true)
        
        
        //Recuperar o Adress
        
        CLGeocoder().reverseGeocodeLocation(userLocation!) { (detalhe, erro) in
            if erro == nil{
                
                if let localData = detalhe?.first{
                    
                    var thoroughfare = ""
                    if localData.thoroughfare != nil{
                        thoroughfare = (localData.thoroughfare)!
                    }
                    
                    var subThoroughfare = ""
                    if localData.subThoroughfare != nil{
                        subThoroughfare = (localData.subThoroughfare)!
                    }
                    
                    var locality = ""
                    if localData.locality != nil{
                        locality = (localData.locality)!
                    }
                    
                    var subLocality = ""
                    if localData.subLocality != nil{
                        subLocality = (localData.subLocality)!
                    }
                    
                    var postalCode = ""
                    if localData.postalCode != nil{
                        postalCode = (localData.postalCode)!
                    }
                    var country = ""
                    if localData.country != nil{
                        country = (localData.country)!
                    }
                    
                    var administrativeArea = ""
                    if localData.administrativeArea != nil{
                        administrativeArea = (localData.administrativeArea)!
                    }
                    
                    var subAdministrativeArea = ""
                    if localData.subAdministrativeArea != nil{
                        subAdministrativeArea = (localData.subAdministrativeArea)!
                    }
                    
                    self.adress.text = thoroughfare + " - " + subThoroughfare + " / " + locality + " / " + country
                                                
                    print(
                        "\n - thoroughfare = " + thoroughfare +
                        "\n - Subthoroughfare = " + subThoroughfare +
                        "\n -  locality = " + locality +
                        "\n - subLocality = " + subLocality +
                        "\n - postalCode = " + postalCode +
                        "\n - country = " + country +
                        "\n - administrativeArea = " + administrativeArea +
                        "\n - subAdministrativeArea = " + subAdministrativeArea
                    )
                    
                }
            }else{
                //nao foi possivel recuperar
            }
        }
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

