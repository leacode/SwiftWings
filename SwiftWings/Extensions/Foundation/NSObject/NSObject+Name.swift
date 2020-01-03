//
//  NSObject+Name.swift
//  SwiftWings
//
//  Created by leacode on 2020/1/3.
//  Copyright © 2020 Leacode. All rights reserved.
//

import Foundation

public extension NSObject {
  /// return name of class
  class var className: String {
    return "\(self)"
  }
  
  /// return name of self's class
  var className: String {
    return "\(Self.self)"
  }
}
