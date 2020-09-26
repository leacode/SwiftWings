//
//  Double+ExtensionsTests.swift
//  SwiftWingsTests
//
//  Created by leacode on 2020/9/25.
//  Copyright © 2020 Leacode. All rights reserved.
//

import XCTest

class Double_ExtensionsTests: XCTestCase {

  func test_toString_returnsExpected() {
    let double: Double = 121.123231
    XCTAssertEqual(double.toString(), "121.12")
  }
  
  func test_toInt_returnsExpected() {
    let double: Double = 321321
    XCTAssertEqual(double.toInt(), 321321)
    XCTAssertEqual(Double(32131.333).toInt(), 32131)
  }
  
}
