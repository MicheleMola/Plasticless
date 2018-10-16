//
//  ChallengeDetailTableViewController.swift
//  Plasticless
//
//  Created by Michele Mola on 16/10/2018.
//  Copyright © 2018 Michele Mola. All rights reserved.
//

import UIKit

class ChallengeDetailTableViewController: UITableViewController {
  
  var challenge: Challenge?
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descriptionTextView: UITextView!
  @IBOutlet weak var rewardLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
  }
  
  func setupView() {
    tableView.tableFooterView = UIView()
    
    if let challenge = challenge {
      titleLabel.text = challenge.title
      descriptionTextView.text = challenge.description
      rewardLabel.text = challenge.reward
    }
  }
  
}
