//
//  String+Extensions.swift
//  SwiftWings
//
//  Created by leacode on 2020/9/3.
//  Copyright © 2020 Leacode. All rights reserved.
//

import Foundation

public extension String {
  
  var asURL: URL? {
    URL(string: self)
  }
  
  var asDict: [String: Any]? {
    guard let data = self.data(using: .utf8) else { return nil }
    return try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
  }
  
  var asArray: [Any]? {
    guard let data = self.data(using: .utf8) else { return nil }
    return try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [Any]
  }
  
  var localized: String {
    NSLocalizedString(self, comment: "")
  }
  
}

public extension String {
  init?(json: Any) {
    guard let data = Data(json: json) else { return nil }
    self.init(decoding: data, as: UTF8.self)
  }
  
  func jsonToDictionary() -> [String: Any]? {
    self.data(using: .utf8)?.jsonToDictionary()
  }
  
  func jsonToArray() -> [Any]? {
    self.data(using: .utf8)?.jsonToArray()
  }
}

