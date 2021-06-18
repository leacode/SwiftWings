//
//  NSObject+Name.swift
//  SwiftWings
//
//  Created by leacode on 2020/1/3.
//  Copyright © 2020 Leacode. All rights reserved.
//

import Foundation

public extension NSObject {
  /// Name of class
  class var className: String {
    String(describing: self)
  }
  
  /// Name of self's class
  var className: String {
    String(describing: Self.self)
  }
}
