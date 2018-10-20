//
//  ProfileTableViewController.swift
//  Plasticless
//
//  Created by Michele Mola on 10/12/18.
//  Copyright © 2018 Michele Mola. All rights reserved.
//

import UIKit

class ProfileTableViewController: UITableViewController {
  
  @IBOutlet weak var profileImageUIImageView: UIImageView!
  @IBOutlet weak var fullnameLabel: UILabel!
  @IBOutlet weak var addressLabel: UILabel!
  @IBOutlet weak var badgeOneImageView: UIImageView!
  @IBOutlet weak var badgeTwoImageView: UIImageView!
  @IBOutlet weak var badgeThreeImageView: UIImageView!
  @IBOutlet weak var badgeFourImageView: UIImageView!
  @IBOutlet weak var badgeFiveImageView: UIImageView!
  @IBOutlet weak var badgeSixImageView: UIImageView!
  
  var superChallenges: [SuperChallenge] = []
  var imageViewCollection: [UIImageView] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
  }
  
  func setupView() {
    self.profileImageUIImageView.layer.masksToBounds = true
    self.profileImageUIImageView.layer.cornerRadius = 90

    self.imageViewCollection = [badgeOneImageView, badgeTwoImageView, badgeThreeImageView, badgeFourImageView, badgeFiveImageView, badgeSixImageView]
  }
  
  override func viewDidAppear(_ animated: Bool) {
    let defaults = UserDefaults.standard
    if let savedUser = defaults.object(forKey: "SavedUser") as? Data {
      let decoder = JSONDecoder()
      if let loadedUser = try? decoder.decode(User.self, from: savedUser) {
        fullnameLabel.text = loadedUser.fullname
        addressLabel.text = loadedUser.address
        
        profileImageUIImageView.image = UIImage(data: loadedUser.image)
        
        getSuperChallenges()
      }
    }
  }
  
  func getSuperChallenges() {
    do {
      self.superChallenges = try GenericCoder.decodeFromFile(withName: .SuperChallenges) ?? []
      var completedSuperChallenges = Int()
      
      let _ = self.superChallenges.map({
        if $0.completed {
          completedSuperChallenges += 1
        }
      })
      
      for i in 0..<completedSuperChallenges {
        self.imageViewCollection[i].alpha = 1.0
      }
      
    } catch let error {
      print(error)
    }
  }
  
  
}
