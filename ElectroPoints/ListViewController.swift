//
//  ListViewController.swift
//  ElectroPoints
//
//  Created by Joaquin on 16/3/21.
//

import UIKit
import CoreLocation

class ListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate, CLLocationManagerDelegate {
    
    var userLocation: CLLocation?
    let manager = CLLocationManager()
    
    @IBOutlet weak var chargingPointsTable: UITableView!{
        didSet {
            chargingPointsTable.delegate = self
            chargingPointsTable.dataSource = self
            chargingPointsTable.rowHeight = 150
        }
    }
    
    // MARK: - Table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celda = tableView.dequeueReusableCell(withIdentifier: "pointCell",for: indexPath) as! PointChargingCell
        
        celda.setChargingPoint(chargingPoint: PointsService.shared.allPoints[indexPath.row])
        
        if let posicionUsuario = userLocation {
            
            let distance = PointsService.shared.allPoints[indexPath.row].getDistance(from: posicionUsuario)
            
            celda.setDistance(distance: distance)
            
        }
        
        return celda
    }
    
    override func viewWillAppear(_ animated: Bool) {
        chargingPointsTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  PointsService.shared.allPoints.count
    }
        
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            PointsService.shared.allPoints.remove(at: indexPath.row)
            chargingPointsTable.deleteRows(at: [indexPath], with: .automatic)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        
        manager.startUpdatingLocation()
    }
    
    // MARK: - Location
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        userLocation = locations.last
        chargingPointsTable.reloadData()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
        
//        let alert = UIAlertController(title: "Error", message: "Se ha producido un error al obtener la localizacion", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//        self.present(alert, animated: true, completion: nil)
        
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus){
        
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
