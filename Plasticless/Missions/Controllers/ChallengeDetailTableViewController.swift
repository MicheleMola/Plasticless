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
  var challenges: [Challenge] = []
  
  var index = Int()
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descriptionTextView: UITextView!
  @IBOutlet weak var rewardLabel: UILabel!
  @IBOutlet weak var completeButton: UIButton!
  
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
      
      if challenge.completed {
        completeButton.setTitle("Completed", for: .normal)
        completeButton.isEnabled = false
        completeButton.backgroundColor = UIColor.green
      } else {
        completeButton.setTitle("Complete", for: .normal)
        completeButton.isEnabled = true
        completeButton.backgroundColor = UIColor.red
      }
      
      getChallenges()
    }
  }
  
  func getChallenges() {
    do {
      self.challenges = try GenericCoder.decodeFromFile(withName: .Challenges) ?? []
      
      if let challenge = challenge {
        if let index = self.challenges.firstIndex(of: challenge) {
          self.index = index
        }
      }
      
    } catch let error {
      print(error)
    }
    
  }
  
  @IBAction func completePressed(_ sender: UIButton) {
    completeButton.setTitle("Completed", for: .normal)
    completeButton.isEnabled = false
    completeButton.backgroundColor = UIColor.green
    
    
    self.challenges[index].completed = true
    
    do {
     try GenericCoder.encodeInFile(withName: .Challenges, andCollection: self.challenges)
      print("Save Completed")
    } catch let error {
      print(error)
    }
    
  }
  
  
}
