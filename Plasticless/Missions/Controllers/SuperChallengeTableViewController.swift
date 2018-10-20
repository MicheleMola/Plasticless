//
//  SuperChallengeTableViewController.swift
//  Plasticless
//
//  Created by Michele Mola on 16/10/2018.
//  Copyright © 2018 Michele Mola. All rights reserved.
//

import UIKit

class SuperChallengeTableViewController: UITableViewController {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descriptionTextView: UITextView!
  @IBOutlet weak var rewardLabel: UILabel!
  @IBOutlet weak var badgeImageView: UIImageView!
  
  var superChallenges: [SuperChallenge] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    getSuperChallenges()
  }
  
  func getSuperChallenges() {
    do {
      self.superChallenges = try GenericCoder.decodeFromFile(withName: .SuperChallenges) ?? []
    
      setupView()
      
    } catch let error {
      print(error)
    }
  }
  
  func setupView() {
    tableView.tableFooterView = UIView()
    
    if let challenge = self.superChallenges.randomElement() {
      titleLabel.text = challenge.title
      descriptionTextView.text = challenge.description
      rewardLabel.text = challenge.reward
      badgeImageView.image = UIImage(named: challenge.badge.imageName)
    }
  }
}
