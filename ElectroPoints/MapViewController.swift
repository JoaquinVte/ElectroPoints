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
                        
                        let info = (posicion,placemark)
                        print("Enviando info")
                        
                        performSegue(withIdentifier: "addPoint", sender: info)
                        
                    }
                }
            }
        }
    }
    
    func addChargingPoint(chargingPoint : ChargingPoint) {
        
        mapView.addAnnotation(chargingPoint)
        PointsService.shared.allPoints.append(chargingPoint)        
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
        if let destination = segue.destination as? FormViewController{
            
            destination.chargingPointCreatedHandler = addChargingPoint
        
            if let info = sender as? (CLLocationCoordinate2D?,CLPlacemark?){
                print("Obteniendo sender")
                if let loc = info.0{
                    destination.posicion = loc
                }
                if let placemark = info.1 {
                    destination.placemark = placemark
                }
                    
            }
        }
    }
    
}

