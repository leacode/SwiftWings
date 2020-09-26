//
//  Sequence+Extensions.swift
//  SwiftWings
//
//  Created by leacode on 2020/2/29.
//  Copyright © 2020 Leacode. All rights reserved.
//

import Foundation

public extension Sequence where Element: Hashable {
  /// returns all unique elements in a Sequence while still maintaining the original order
  func unique() -> [Element] {
    var seen: Set<Element> = []
    return filter {
      // the insert(_:) method returns a tuple including an inserted boolean which is set to true if the object was inserted and false if not
      seen.insert($0).inserted
    }
  }
}
