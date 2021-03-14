//
//  ViewController.swift
//  ElectroPoints
//
//  Created by Joaquin on 14/3/21.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let posicion:CLLocation = CLLocation.init(latitude: 38.70545, longitude: -0.47432)
        let dist:CLLocationDistance = CLLocationDistance(5000)
        
        let region:MKCoordinateRegion = MKCoordinateRegion(center: posicion.coordinate, latitudinalMeters: dist, longitudinalMeters: dist)
        
        mapView.setRegion(region, animated: true)
        
        let toqueLargo:UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(toqueLargoDetectado(gesto:)))
        toqueLargo.minimumPressDuration=2
        
        mapView.addGestureRecognizer(toqueLargo)

    }
    
    @objc func toqueLargoDetectado(gesto:UIGestureRecognizer){
        
        if(gesto.state==UIGestureRecognizer.State.began){
            
            let punto = gesto.location(in: mapView)
            
            let posicion:CLLocationCoordinate2D = mapView.convert(punto, toCoordinateFrom: mapView)
            
            let anotacion = MKPointAnnotation()
            anotacion.coordinate = posicion
            
            mapView.addAnnotation(anotacion)
        }
        
    }
}
