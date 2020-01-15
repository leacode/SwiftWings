//
//  Mirror+Reflection.swift
//  SwiftWings
//
//  Created by leacode on 2020/1/13.
//  Copyright © 2020 Leacode. All rights reserved.
//

import Foundation

extension Mirror {
  static func reflectProperties<T>(
    of target: Any,
    matchingType type: T.Type = T.self,
    recursively: Bool = false,
    using closure: (T) -> Void
  ) {
    let mirror = Mirror(reflecting: target)
    
    for child in mirror.children {
      (child.value as? T).map(closure)
      
      if recursively {
        // To enable recursive reflection, all we have to do
        // is to call our own method again, using the value
        // of each child, and using the same closure.
        Mirror.reflectProperties(
          of: child.value,
          recursively: true,
          using: closure
        )
      }
    }
  }
}
