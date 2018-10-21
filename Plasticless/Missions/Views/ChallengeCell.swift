//
//  ChallengeCell.swift
//  Plasticless
//
//  Created by Michele Mola on 16/10/2018.
//  Copyright © 2018 Michele Mola. All rights reserved.
//

import UIKit

class ChallengeCell: UITableViewCell {
  static let reuseIdentifier = "ChallengeCell"
  
  @IBOutlet weak var photoImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var checkImageView: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  func configure(withChallenge challenge: Challenge) {
    self.titleLabel.text = challenge.title
    self.checkImageView.image = challenge.completed ? UIImage(named: "checkicon") : nil
    
    self.photoImageView.image = UIImage(named: challenge.imageName)
  }
  
}
