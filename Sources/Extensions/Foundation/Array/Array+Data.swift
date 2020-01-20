//
//  Array+Data.swift
//  SwiftWings
//
//  Created by leacode on 2020/1/20.
//  Copyright © 2020 Leacode. All rights reserved.
//

import Foundation

public extension Array where Element == UInt8 {
  var data : Data{
    return Data(self)
  }
}
