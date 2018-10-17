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
    
    // Not correct - Use Kingfisher
    DispatchQueue.global().async {
      let data = try? Data(contentsOf: challenge.imageURL)
      DispatchQueue.main.async {
        self.photoImageView.image = UIImage(data: data!)
      }
    }
  }
  
}
