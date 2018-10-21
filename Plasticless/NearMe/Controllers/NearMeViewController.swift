//
//  NearMeViewController.swift
//  Plasticless
//
//  Created by Emilio Arvonio on 15/10/2018.
//  Copyright © 2018 Michele Mola. All rights reserved.
//

import UIKit

class NearMeViewController: UIViewController {
  
  @IBOutlet weak var containerMap: UIView!
  @IBOutlet weak var containerList: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  
  @IBAction func segmentedControlPressed(_ sender: UISegmentedControl) {
    
    if sender.selectedSegmentIndex == 0 {
      
      containerMap.isHidden = false
      containerList.isHidden = true
    } else {
      containerList.isHidden = false
      containerMap.isHidden = true
    }
  }
  
}
