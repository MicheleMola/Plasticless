//
//  ChallengesTableViewController.swift
//  Plasticless
//
//  Created by Michele Mola on 16/10/2018.
//  Copyright © 2018 Michele Mola. All rights reserved.
//

import UIKit

class ChallengesTableViewController: UITableViewController {
  
  var challenges: [Challenge] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    getChallenges()
  }
  
  func getChallenges() {
    self.challenges = GenericDecoder.decodeFromFile(withName: "Challenges") ?? []
    tableView.reloadData()
  }
  
}

// MARK: - Implemented DataSource Protocol
extension ChallengesTableViewController {
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return challenges.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let challengeCell = tableView.dequeueReusableCell(withIdentifier: ChallengeCell.reuseIdentifier, for: indexPath) as! ChallengeCell
    
    let challenge = self.challenges[indexPath.row]
    challengeCell.configure(withChallenge: challenge)
    
    return challengeCell
  }
}

// MARK: - Implemented Delegate Protocol
extension ChallengesTableViewController {
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80
  }
}
