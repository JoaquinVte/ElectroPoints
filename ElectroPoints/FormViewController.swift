//
//  FormViewController.swift
//  ElectroPoints
//
//  Created by Joaquin on 14/3/21.
//

import UIKit
import CoreLocation

class FormViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var chargingPointCreatedHandler:((_ chargingPoint: ChargingPoint)->())?
    
    var posicion : CLLocationCoordinate2D? = nil
    var placemark : CLPlacemark? = nil

    @IBOutlet weak var direccion1: UILabel!
    @IBOutlet weak var direccion2: UILabel!
    @IBOutlet weak var precioTextField: UITextField!
    @IBOutlet weak var potenciaTextField: UITextField!
       
    @IBOutlet weak var tipoPicker: UIPickerView!{
        didSet {
            tipoPicker.delegate = self
            tipoPicker.dataSource = self
        }
    }
    
    @IBAction func btnAñadir(_ sender: Any) {
        var newChargingPoint : ChargingPoint? = nil
        
        if let precio = Double(precioTextField.text!){
            
            if let potencia = Double(potenciaTextField.text!){
                
                newChargingPoint = ChargingPoint(name: direccion2.text! ,street: direccion1.text! ,power: potencia,price: precio,coordinates: Coordinate.init(latitude: posicion!.latitude, longitude: posicion!.longitude), type: tipoPicker.selectedRow(inComponent: 0))
                chargingPointCreatedHandler?(newChargingPoint!)
                
                navigationController?.popViewController(animated: true)
            } else {
                showError(message: "Debes introducir una potencia correcta.")
            }
        } else {
            showError(message: "Debes introducir un precio correcto.")
        }
    }
    
    func showError(message: String)->Void {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        direccion1.text = placemark?.thoroughfare ?? "Desconocido"
        direccion2.text = placemark?.locality ?? "Desconocido"
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ConnectorType.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ConnectorType.allCases[row].description
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    // override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //
    // }
    
}
  


