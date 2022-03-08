//
//  ViewController.swift
//  Maps
//
//  Created by Rethink on 04/03/22.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{

    @IBOutlet weak var map: MKMapView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    
        
//
//        let latitude: CLLocationDegrees = -19.512654
//        let longitude: CLLocationDegrees = -42.560057
//
//        // quanto menor o valor de delta mais prox do mapa
//        let deltaLatitude: CLLocationDegrees = 0.002
//        let deltaLongitude: CLLocationDegrees = 0.002
//        //local 2d é o latitude e longitude
//        let local: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
//
//        let areaView: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: deltaLatitude, longitudeDelta: deltaLongitude)
//
//
//        let region: MKCoordinateRegion = MKCoordinateRegion(center: local, span: areaView)
//        map.setRegion(region, animated: true)
//
//
//        let annotation = MKPointAnnotation()
//
//        // Configurar o ponto
//        annotation.coordinate = local
//        annotation.title = "Casa"
//        annotation.subtitle = "Minha Casa"
//
//        map.addAnnotation(annotation)
        
    }


}

