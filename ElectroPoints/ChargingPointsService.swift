//
//  ChargingPointsService.swift
//  ElectroPoints
//
//  Created by Joaquin on 16/3/21.
//

import Foundation

class PointsService {
    
    static var shared : PointsService = PointsService()
    var allPoints : [ChargingPoint] = [] {
        didSet {
            
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(allPoints){
                let defaults = UserDefaults.standard
                defaults.set(encoded, forKey: "chargingPoints")
            }
        }
    }
    
    private init(){
        
    }
    
}
