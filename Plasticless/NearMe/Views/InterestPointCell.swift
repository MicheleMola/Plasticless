//
//  InterestPointCell.swift
//  Plasticless
//
//  Created by Emilio Arvonio on 18/10/2018.
//  Copyright © 2018 Michele Mola. All rights reserved.
//

import UIKit
import Kingfisher

class InterestPointCell: UITableViewCell {
  static let reuseIdentifier = "InterestPointCell"
  
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
  
  func configure(withInterestPoint point: InterestPoint) {
    self.titleLabel.text = point.name
    
    self.photoImageView.kf.setImage(with: point.imageURL, placeholder: UIImage(named: "placeholder"))
  }
  
}
