//
//  ProfileTableViewController.swift
//  Plasticless
//
//  Created by Michele Mola on 10/12/18.
//  Copyright © 2018 Michele Mola. All rights reserved.
//

import UIKit

class ProfileTableViewController: UITableViewController {
  
  @IBOutlet weak var profileImageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    profileImageView.layer.masksToBounds = true
    profileImageView.layer.cornerRadius = 10
  }
  
  
  
}
