//
//  Challenge.swift
//  Plasticless
//
//  Created by Michele Mola on 10/16/18.
//  Copyright © 2018 Michele Mola. All rights reserved.
//

import UIKit

struct Challenge: Mission, Codable {
  var completed: Bool
  var title: String
  var imageURL: URL
  var description: String
  var reward: String
}

extension Challenge: Equatable {
  static func ==(lhs: Challenge, rhs: Challenge) -> Bool {
    return lhs.title == rhs.title
  }
}
