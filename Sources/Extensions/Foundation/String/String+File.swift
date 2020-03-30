//
//  String+File.swift
//  SwiftWings
//
//  Created by leacode on 2020/2/29.
//  Copyright © 2020 Leacode. All rights reserved.
//

import Foundation

extension String {
  var fileExtension: String? {
    guard let period = lastIndex(of: ".") else {
      return nil
    }
    let extensionStart = index(after: period)
    return String(self[extensionStart...])
  }
}
