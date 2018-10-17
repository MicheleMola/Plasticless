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
        
        // Do any additional setup after loading the view.
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
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
