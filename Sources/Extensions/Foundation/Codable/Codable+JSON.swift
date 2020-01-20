//
//  Codable+JSON.swift
//  SwiftWings
//
//  Created by leacode on 2020/1/20.
//  Copyright © 2020 Leacode. All rights reserved.
//

import Foundation

public extension Encodable {
  var jsonString: String? {
    let jsonEncoder = JSONEncoder()
    do {
      let jsonData = try jsonEncoder.encode(self)
      return String(data: jsonData, encoding: .utf8)
    } catch {
      return nil
    }
  }
  
  func dictionary() throws -> [String: Any]? {
    let data = try JSONEncoder().encode(self)
    
    return try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String : Any]
  }
}
