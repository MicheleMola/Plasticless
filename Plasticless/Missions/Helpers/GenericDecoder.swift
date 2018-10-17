//
//  GenericDecoder.swift
//  Plasticless
//
//  Created by Michele Mola on 16/10/2018.
//  Copyright © 2018 Michele Mola. All rights reserved.
//

import Foundation

class GenericDecoder {
  class func decodeFromFile<T: Decodable>(withName name: String) -> T? {
    if let url = Bundle.main.url(forResource: name, withExtension: "json") {
      do {
        let data = try Data(contentsOf: url)
        let jsonData = try JSONDecoder().decode(T.self, from: data)
        return jsonData
      } catch let error {
        print(error)
        return nil
      }
    }
    return nil
  }
}
