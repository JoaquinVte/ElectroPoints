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
    let type:Int
    

    init(name:String,street:String,power:Double,price:Double,coordinate:CLLocationCoordinate2D,type : Int) {
        
        self.coordinate=coordinate
        self.name=name
        self.street=street
        self.power=power
        self.price=price
        self.type = type
        title = name
        subtitle = street
        
        
        super.init()
    }
    
    
    
    
}

enum ConnectorType: Int , CustomStringConvertible, CaseIterable {
          
    var description: String {
        switch self {
        case .schuko:
            return "Shuko"
        case .mennekes:
            return "Mennekes"
        case .chademo:
            return "Chademo"
        }
    }
    case schuko = 1, mennekes = 2, chademo = 3
            
}
