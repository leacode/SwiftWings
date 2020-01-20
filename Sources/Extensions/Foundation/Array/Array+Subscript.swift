//
//  Array+Subscript.swift
//  SwiftWings
//
//  Created by leacode on 2020/1/19.
//  Copyright © 2020 Leacode. All rights reserved.
//

import Foundation

extension Array {
  
  /// when a index is out of bound, the subscription returns nil
  public subscript(guard idx: Int) -> Element? {
    guard (startIndex..<endIndex).contains(idx) else {
      return nil
    }
    return self[idx]
  }
  
  ///
  /// filter out the non nil values and unwrap each element
  ///
  ///[1, 2, 3, 4].reduct(+) Optional(10)
  ///
  /// - Parameter nextPartialResult: hanle closure
  public func reduct(_ nextPartialResult: (Element, Element)->Element) -> Element? {
    return first.map {
      dropFirst().reduce($0, nextPartialResult)
    }
  }
  
}
