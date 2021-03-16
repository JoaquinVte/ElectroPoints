//
//  ListViewController.swift
//  ElectroPoints
//
//  Created by Joaquin on 16/3/21.
//

import UIKit

class ListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    
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
        celda.backgroundColor = .clear
        
//        tableView.backgroundColor = .clear
//        tableView.tableFooterView = UIView()
        
        return celda
    }
    
    override func viewWillAppear(_ animated: Bool) {
        chargingPointsTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  PointsService.shared.allPoints.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        workoutSelected = workouts[indexPath.row]
//
//        performSegue(withIdentifier: "workoutsToDetails", sender: self)
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
