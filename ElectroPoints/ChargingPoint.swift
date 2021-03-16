//
//  ChargingPoint.swift
//  ElectroPoints
//
//  Created by Joaquin on 14/3/21.
//
import Foundation
import MapKit

class ChargingPoint: NSObject,MKAnnotation,Codable {
    
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
     
    var title:String?
    var subtitle:String?
    var coordinates : Coordinate
    
    
    let name:String
    let street:String
    let power:Double
    let price:Double
    let type:Int
    

    init(name:String,street:String,power:Double,price:Double,coordinates:Coordinate,type : Int) {
        
        self.coordinates=coordinates
        self.name=name
        self.street=street
        self.power=power
        self.price=price
        self.type = type
        title = name
        subtitle = street
        
        
        super.init()
    }
    
    func getDistance(from other: CLLocation) -> CLLocationDistance {
        let posicion : CLLocation = CLLocation(latitude: coordinates.latitude, longitude: coordinates.longitude)
        return posicion.distance(from: other)
    }
    
    
}

enum ConnectorType: Int , CustomStringConvertible, CaseIterable, Codable {
          
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

struct Coordinate: Codable, Hashable {
    
    var latitude : Double
    var longitude : Double
    
}
