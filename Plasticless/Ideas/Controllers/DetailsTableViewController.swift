//
//  DetailsTableViewController.swift
//  Plasticless
//
//  Created by Antonio Biondi on 16/10/2018.
//  Copyright © 2018 Michele Mola. All rights reserved.
//

import UIKit
import Kingfisher

class DetailsTableViewController: UITableViewController {
  
  var idea: Idea?
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var descriptionTextView: UITextView!
  @IBOutlet weak var titleLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
  }
  
  func setupView() {
    tableView.tableFooterView = UIView()
    
    if let idea = idea {
      
      // Kingfisher
      imageView.kf.setImage(with: idea.imageURL, placeholder: UIImage(named: "placeholder"))

      titleLabel.text = idea.title
      descriptionTextView.text = idea.description
    }
  }
}
