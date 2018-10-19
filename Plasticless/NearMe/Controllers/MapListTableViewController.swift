//
//  MapListTableViewController.swift
//  Plasticless
//
//  Created by Emilio Arvonio on 15/10/2018.
//  Copyright © 2018 Michele Mola. All rights reserved.
//

import UIKit

class MapListTableViewController: UITableViewController {

  var points: [InterestPoint] = []
  
  override func viewDidLoad() {
        super.viewDidLoad()

        getPoints()
    
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
  
  func getPoints() {
    self.points = GenericDecoder.decodeFromFile(withName: "InterestPoints") ?? []
    print(self.points)
    tableView.reloadData()
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showDetail" {
      if let interestPointDetailTVC = segue.destination as? MapListDetailsTableViewController {
        if let indexPath = self.tableView.indexPathForSelectedRow {
          interestPointDetailTVC.point = self.points[indexPath.row]
        }
      }
    }
  }


}

extension MapListTableViewController {
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return points.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let interestPointCell = tableView.dequeueReusableCell(withIdentifier: InterestPointCell.reuseIdentifier, for: indexPath) as! InterestPointCell
    
    let point = self.points[indexPath.row]
    interestPointCell.configure(withInterestPoint: point)
    
    return interestPointCell
  }
}

// MARK: - Implemented Delegate Protocol
extension MapListTableViewController {
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80
  }
}
