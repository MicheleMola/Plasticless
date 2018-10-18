//
//  DetailsTableViewController.swift
//  Plasticless
//
//  Created by Antonio Biondi on 16/10/2018.
//  Copyright © 2018 Michele Mola. All rights reserved.
//

import UIKit

class DetailsTableViewController: UITableViewController {

    var idea: Idea?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var stepsTextView: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupView()
    }
    
    func setupView() {
        tableView.tableFooterView = UIView()
        
        if let idea = idea {
            
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: idea.imageURL)
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data!)
                }
            }
            
            titleLabel.text = idea.title
            descriptionTextView.text = idea.description
            stepsTextView.text = idea.steps
        }
    }
}
