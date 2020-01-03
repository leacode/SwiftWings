//
//  String+Subscript.swift
//  SwiftWings
//
//  Created by leacode on 2020/1/3.
//  Copyright © 2020 Leacode. All rights reserved.
//

import Foundation

// slicing
public extension String {
  /// Substring from closed range
  ///
  /// For example:
  ///
  ///     let str = "12345678"
  ///     print(str[2...5])
  ///     // Prints "3456"
  ///
  /// - Parameter bounds: e.g. ( x...x )
  subscript(bounds: ClosedRange<Int>) -> String {
    if bounds.lowerBound < 0 || bounds.upperBound > count - 1 { return "" }
    return String(self[self.index(startIndex, offsetBy: bounds.lowerBound) ... self.index(self.startIndex, offsetBy: bounds.upperBound)])
  }
  
  /// Substring from half-open range
  ///
  /// For example:
  ///
  ///     let str = "12345678"
  ///     print(str[2..<5])
  ///     // Prints "345"
  ///
  /// - Parameter bounds: ( x..<x )
  subscript(range: Range<Int>) -> String? {
    guard let lowerIndex = index(startIndex, offsetBy: max(0, range.lowerBound), limitedBy: endIndex) else { return nil }
    guard let upperIndex = index(lowerIndex, offsetBy: range.upperBound - range.lowerBound, limitedBy: endIndex) else { return nil }
    return String(self[lowerIndex ..< upperIndex])
  }
  
  /// Substring from a partial interval extending upward from a lower bound range
  ///
  /// For example:
  ///
  ///     let str = "12345678"
  ///     print(str[2...])
  ///     // Prints "345678"
  ///
  /// - Parameter bounds: ( x... )
  subscript(bounds: PartialRangeFrom<Int>) -> String {
    if bounds.lowerBound < 0 || bounds.lowerBound > count - 1 { return "" }
    return String(self[self.index(startIndex, offsetBy: bounds.lowerBound)...])
  }
  
  /// Substring from a partial interval up to range
  ///
  /// For example:
  ///
  ///     let str = "12345678"
  ///     print(str[...5])
  ///     // Prints "123456"
  ///
  /// - Parameter bounds: ( ...x )
  subscript(bounds: PartialRangeThrough<Int>) -> String {
    if bounds.upperBound < 0 || bounds.upperBound > count - 1 { return "" }
    return String(self[...self.index(startIndex, offsetBy: bounds.upperBound)])
  }
  
  /// Substring from partial half-open interval up to, but not including, an upper bound range
  ///
  /// For example:
  ///
  ///     let str = "12345678"
  ///     print(str[..<5])
  ///     // Prints "12345"
  ///
  /// - Parameter bounds: ( ..<x )
  subscript(bounds: PartialRangeUpTo<Int>) -> String {
    if bounds.upperBound < 0 || bounds.upperBound > count { return "" }
    return String(self[..<self.index(startIndex, offsetBy: bounds.upperBound)])
  }
}
