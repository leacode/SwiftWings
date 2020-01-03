//
//  String+SubscriptTests.swift
//  SwiftWingsTests
//
//  Created by leacode on 2020/1/3.
//  Copyright © 2020 Leacode. All rights reserved.
//

import XCTest
@testable import SwiftWings

class String_SubscriptTests: XCTestCase {
  
  func test_subscript_ClosedRange_returnsExpected() {
    // given
    let expected = "3456"
    
    // when
    let str = "12345678"
    let result = str[2...5]
    
    // then
    XCTAssertEqual(result, expected)
  }
  
  func test_subscript_halfOpenRange_returnsExpected() {
    // given
    let expected = "345"
    
    // when
    let str = "12345678"
    let result = str[2..<5]
    
    // then
    XCTAssertEqual(result, expected)
  }
  
  func test_subscript_PartialRangeFrom_returnsExpected() {
    // given
    let expected = "345678"
    
    // when
    let str = "12345678"
    let result = str[2...]
    
    // then
    XCTAssertEqual(result, expected)
  }
  
  func test_subscript_PartialRangeThrough_returnsExpected() {
    // given
    let expected = "123456"
    
    // when
    let str = "12345678"
    let result = str[...5]
    
    // then
    XCTAssertEqual(result, expected)
  }
  
  func test_subscript_PartialRangeUpTo_returnsExpected() {
    // given
    let expected = "12345"
    
    // when
    let str = "12345678"
    let result = str[..<5]
    
    // then
    XCTAssertEqual(result, expected)
  }
  
}
