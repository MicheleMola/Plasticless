//
//  MapListDetailsTableViewController.swift
//  Plasticless
//
//  Created by Emilio Arvonio on 19/10/2018.
//  Copyright © 2018 Michele Mola. All rights reserved.
//

import UIKit

class MapListDetailsTableViewController: UITableViewController {
  
  @IBOutlet weak var imageUIImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var durationLabel: UILabel!
  @IBOutlet weak var descriptionTextView: UITextView!
  @IBOutlet weak var durationTableViewCell: UITableViewCell!
  @IBOutlet var mapListDetailTVC: UITableView!
  
  @IBOutlet weak var typeLabel: UILabel!
  
  var point: InterestPoint?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //self.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    setupView()
  }
  
  
  func setupView() {
    tableView.tableFooterView = UIView()
    
    if let point = point {
      nameLabel.text = point.name
      descriptionTextView.text = point.description
      if point.duration == "" {
        durationTableViewCell.isHidden = true
      } else {
        durationLabel.text = point.duration
      }
      
      self.imageUIImageView.kf.setImage(with: point.imageURL, placeholder: UIImage(named: "placeholder"))
      
      typeLabel.text = point.type
    }
  }
  
}
