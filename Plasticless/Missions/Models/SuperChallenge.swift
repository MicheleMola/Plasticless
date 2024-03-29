//
//  SuperChallenge.swift
//  Plasticless
//
//  Created by Michele Mola on 10/16/18.
//  Copyright © 2018 Michele Mola. All rights reserved.
//

import UIKit

struct SuperChallenge: Mission, Codable {
  var completed: Bool
  var title: String
  var description: String
  var reward: String
  
  var badge: Badge
}
