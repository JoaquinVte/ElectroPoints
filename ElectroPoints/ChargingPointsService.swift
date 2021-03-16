//
//  ChargingPointsService.swift
//  ElectroPoints
//
//  Created by Joaquin on 16/3/21.
//

import Foundation

class PointsService {
    
    static var shared : PointsService = PointsService()
    var allPoints : [ChargingPoint] = []
    
    private init(){
        
    }
    
}
