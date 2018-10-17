//
//  Mission.swift
//  Plasticless
//
//  Created by Michele Mola on 10/16/18.
//  Copyright © 2018 Michele Mola. All rights reserved.
//

import UIKit

protocol Mission {
  var title: String { get set }
  var imageURL: URL { get set }
  var description: String { get set }
  var reward: String { get set }
}
