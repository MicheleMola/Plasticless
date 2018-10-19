//
//  GenericDecoder.swift
//  Plasticless
//
//  Created by Michele Mola on 16/10/2018.
//  Copyright © 2018 Michele Mola. All rights reserved.
//

enum FileNames: String {
  case Challenges = "Challenges"
}

import Foundation

class GenericCoder {
  static func decodeFromFile<T: Decodable>(withName name: FileNames) throws -> T? {
    if let url = Bundle.main.url(forResource: name.rawValue, withExtension: "json") {
      do {
        let data = try Data(contentsOf: url)
        
        do {
          let jsonData = try JSONDecoder().decode(T.self, from: data)
          return jsonData
        
        } catch {
          throw GenericCoderError.invalidDecode
        }
      } catch {
        throw  GenericCoderError.invalidDataCreation
      }
    }
    throw GenericCoderError.invalidURL
  }
  
  static func encodeInFile<T: Encodable>(withName name: FileNames, andCollection collection: T) throws {
    
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    
    do {
      let jsonData = try encoder.encode(collection)
      if let jsonString = String(data: jsonData, encoding: .utf8) {
      
        var fileURL: URL!
        let filename = "\(name.rawValue).json"
        switch name {
        case .Challenges:
          fileURL = GenericCoder().getDocumentsDirectory().appendingPathComponent(filename)
        }
        
        do {
          try jsonString.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
        } catch {
          throw GenericCoderError.invalidWritingToFile
        }
        
      } else {
        throw GenericCoderError.invalidStringCreation
      }
      
    }
    catch {
      throw GenericCoderError.invalidEncode
    }
  }

  private func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
  }
  
}
