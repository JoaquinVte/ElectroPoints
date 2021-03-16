//
//  PointChargingCell.swift
//  ElectroPoints
//
//  Created by Joaquin on 16/3/21.
//

import UIKit

class PointChargingCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var potenciaLabel: UILabel!
    @IBOutlet weak var precioLabel: UILabel!
    @IBOutlet weak var typeImage: UIImageView!
    
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
       
//        let dateFormatterPrint = DateFormatter()
//        dateFormatterPrint.dateFormat = "dd-MM-yyyy"
//        
//        labelDate.text = dateFormatterPrint.string(from: workout.date)
//        labelDuration.text = "Duracion: " + String(workout.duration) + " minutos"
//        labelType.text = workout.type.rawValue
        
    }

}
