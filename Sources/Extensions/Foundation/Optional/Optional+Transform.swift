//
//  Optional+Transform.swift
//  SwiftWings
//
//  Created by leacode on 2020/1/19.
//  Copyright © 2020 Leacode. All rights reserved.
//

import Foundation

infix operator ???: NilCoalescingPrecedence


/// Giving different type of value when the value is nil
///
/// - Parameters:
///   - optional: original value
///   - defaultValue: default value
public func ???<T>(optional: T?, defaultValue: @autoclosure () -> String) -> String {
  switch optional {
  case let value?: return String(describing: value)
  case nil: return defaultValue()
  }
}
