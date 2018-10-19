//
//  IdeasTableViewController.swift
//  Plasticless
//
//  Created by Antonio Biondi on 16/10/2018.
//  Copyright © 2018 Michele Mola. All rights reserved.
//

import UIKit

class IdeasTableViewController: UITableViewController {
    
    let sections: [String] = ["Creativity","Suggestion"]
    var ideas: [Idea] = []
    var finalIdeas: [[Idea]] = [[]]

    override func viewDidLoad() {
        super.viewDidLoad()
        getIdeas()
    }
    
    func getIdeas() {
      do {
        self.ideas = try GenericCoder.decodeFromFile(withName: .Ideas) ?? []
        dividiIdeas()
      } catch let error {
        print(error)
      }
      
    }
    
    func dividiIdeas() {

        var ideas1: [Idea] = []
        var ideas2: [Idea] = []

        for idea in ideas {
            if self.sections[0] == idea.category.rawValue {
                ideas1.append(idea)
            } else {
                ideas2.append(idea)
            }
        }
        
        finalIdeas = [ideas1] + [ideas2]
        
        tableView.reloadData()

    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section]
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let ideaDetailsTVC = segue.destination as? DetailsTableViewController {
                if let indexPath = self.tableView.indexPathForSelectedRow {
                    ideaDetailsTVC.idea = self.finalIdeas[indexPath.section][indexPath.row]
                }
            }
        }
    }
    
}

// MARK: - Implemented Delegate Protocol
extension IdeasTableViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ideaCell = tableView.dequeueReusableCell(withIdentifier: IdeaCell.reuseIdentifier, for: indexPath) as! IdeaCell

        let idea = self.finalIdeas[indexPath.section][indexPath.row]
        ideaCell.configure(withIdea: idea)

        return ideaCell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.finalIdeas[section].count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
