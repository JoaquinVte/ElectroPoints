//
//  ChargingPoint.swift
//  ElectroPoints
//
//  Created by Joaquin on 14/3/21.
//
import Foundation
import MapKit

class ChargingPoint: NSObject,MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title:String?
    var subtitle:String?
    
    
    let name:String
    let street:String
    let power:Double
    let price:Double
    

    init(name:String,street:String,power:Double,price:Double,coordinate:CLLocationCoordinate2D) {
        
        self.coordinate=coordinate
        self.name=name
        self.street=street
        self.power=power
        self.price=price
        title = name
        subtitle = street
        
        super.init()
    }
    
    enum ConnectorType: Int {
        
        case schuko = 1
        case mennekes = 2
        case chademo = 3
            	
    }
    
    
}
