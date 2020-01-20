//
//  Array+SubscriptTests.swift
//  SwiftWingsTests
//
//  Created by leacode on 2020/1/20.
//  Copyright © 2020 Leacode. All rights reserved.
//

import XCTest
@testable import SwiftWings

class Array_SubscriptTests: XCTestCase {
  
  func test_Array_guardsubscript_returnsExpected() {
    let array = [1, 2, 3, 4, 5]
    XCTAssertEqual(array[guard: 6] ?? 0, 0)
    XCTAssertEqual(array[guard: 1] ?? 0, 2)
  }

    func test_Array_reduct_returnsExpected() {
      XCTAssertEqual([1, 2, 3, 4].reduct(+), 10)
      XCTAssertEqual([9, 3, 2, 1].reduct(-), 3)
      XCTAssertEqual([1, 2, 3, 4].reduct(*), 24)
      
    }

}
