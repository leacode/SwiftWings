//
//  Double+Extensions.swift
//  SwiftWings
//
//  Created by leacode on 2020/9/3.
//  Copyright © 2020 Leacode. All rights reserved.
//

import Foundation

public extension Double {
  
  func toString() -> String {
    String(format: "%.02f", self)
  }
  
}

public extension BinaryFloatingPoint {
  
  func toInt() -> Int {
    Int(self)
  }
  
}
