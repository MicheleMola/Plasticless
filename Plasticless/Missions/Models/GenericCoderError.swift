//
//  GenericCoderError.swift
//  Plasticless
//
//  Created by Michele Mola on 10/18/18.
//  Copyright © 2018 Michele Mola. All rights reserved.
//

import Foundation

enum GenericCoderError: Error {
  case invalidURL
  case invalidDataCreation
  case invalidDecode
  case invalidEncode
  case invalidStringCreation
  case invalidWritingToFile
}
