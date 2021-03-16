//
//  PointChargingCell.swift
//  ElectroPoints
//
//  Created by Joaquin on 16/3/21.
//

import UIKit
import CoreLocation

class PointChargingCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var potenciaLabel: UILabel!
    @IBOutlet weak var precioLabel: UILabel!
    @IBOutlet weak var typeImage: UIImageView!
    @IBOutlet weak var distanceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setChargingPoint(chargingPoint: ChargingPoint){
        
        nameLabel.text = chargingPoint.name
        streetLabel.text = chargingPoint.street
        potenciaLabel.text = String(chargingPoint.power)
        precioLabel.text = String(chargingPoint.price)
        switch(chargingPoint.type){
        case 1:
            typeImage.image = UIImage(named: "schuko")
            break
        case 2:
            typeImage.image = UIImage(named: "mennekes")
            break
        case 3:
            typeImage.image = UIImage(named: "chademo")
            break
        default:
            break
        }
    }
    
    func setDistance(distance: CLLocationDistance ) -> Void {
        
        if(distance > 1000){
            distanceLabel.text = String(format: "%.01f km",distance/1000)
        } else {
            distanceLabel.text = String(format: "%.01f m",distance)
        }
    }

}
