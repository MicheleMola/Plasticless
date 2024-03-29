//
//  IdeaCell.swift
//  Plasticless
//
//  Created by Antonio Biondi on 17/10/2018.
//  Copyright © 2018 Michele Mola. All rights reserved.
//

import UIKit
import Kingfisher

class IdeaCell: UITableViewCell {
  static let reuseIdentifier = "IdeaCell"
  
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
  
  func configure(withIdea idea: Idea) {
    self.titleLabel.text = idea.title
    
    photoImageView.kf.setImage(with: idea.imageURL, placeholder: UIImage(named: "placeholder"))
  }
  
}
