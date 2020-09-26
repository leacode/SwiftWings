//
//  CodableModel.swift
//  SwiftWingsTests
//
//  Created by leacode on 2020/1/20.
//  Copyright © 2020 Leacode. All rights reserved.
//

import Foundation

struct CodableModel: Codable {
  let name: String
  let number: Int
  let date: Date
  let price: Double
}

class SomeClass { }
