//
//  Data+PrettyJSON.swift
//  SwiftWings
//
//  Created by leacode on 2020/1/20.
//  Copyright © 2020 Leacode. All rights reserved.
//

import Foundation

public extension Data {
  
  /// pring json data pretty
  ///
  /// If you use String instead with NSString,
  ///
  /// the output in consol will be escaped
  ///
  /// like “{\n \”userId\”: 1,\n \”id\”: 1,\n \”title\”: ...
  ///
  /// So don't use String for return type
  var prettyJSONString: NSString? {
    guard let jsonObject = try? JSONSerialization.jsonObject(with: self, options: [.allowFragments]),
      let data = try? JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted]),
      let prettyPrintedString = String(data: data, encoding: .utf8) else { return nil }
    return prettyPrintedString as NSString
  }
  
}
