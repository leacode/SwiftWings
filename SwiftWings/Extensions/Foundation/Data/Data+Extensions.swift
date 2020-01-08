//
//  Data+Extensions.swift
//  SwiftWings
//
//  Created by leacode on 2020/1/8.
//  Copyright © 2020 Leacode. All rights reserved.
//

import Foundation

public extension Data {
  var bytes: [UInt8] {
    return [UInt8](self)
  }
}
