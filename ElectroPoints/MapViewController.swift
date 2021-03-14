//
//  ViewController.swift
//  ElectroPoints
//
//  Created by Joaquin on 14/3/21.
//

import UIKit
import MapKit
import CoreLocation

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
            
            
            let localizacion:CLLocation = CLLocation(latitude: posicion.latitude, longitude: posicion.longitude)
            
            CLGeocoder().reverseGeocodeLocation(localizacion) {
                
               [unowned self] (placemarks, error) in
                
                if let error=error {
                    
                    print(error)
                    
                }else{
                    
                    if let placemark = placemarks?[0]{
                        
                        var direccion:String = ""
                        var ciudad:String = ""
                        
                        if let direction = placemark.thoroughfare {
                            direccion=direction
                            print(direccion)
                        }
                        if let city = placemark.locality {
                            ciudad = city
                        }
                        
                        let anotacion:ChargingPoint = ChargingPoint(name: ciudad,street: direccion ,power: 1.1,price: 2.2,coordinate:posicion)
                        
                        self.mapView.addAnnotation(anotacion)
                        
                    }
                    
                }
                
            }
           
        }
        
    }
    
}

