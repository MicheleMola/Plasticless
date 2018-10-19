//
//  InterestPoint.swift
//  Plasticless
//
//  Created by Emilio Arvonio on 16/10/2018.
//  Copyright © 2018 Michele Mola. All rights reserved.
//

import MapKit

class InterestPoint: Codable {
  let imageURL: URL
  let name: String
  let description: String
  let type: String
  let latitude: Double
  let longitude: Double
}
