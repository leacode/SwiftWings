//
//  Int+ChineseCurrency.swift
//  SwiftWings
//
//  Created by leacode on 2020/3/30.
//  Copyright © 2020 Leacode. All rights reserved.
//

import Foundation

public extension Int {
  var chineseMoneySpell: String? {
    Double(self).chineseMoneySpell
  }
}
