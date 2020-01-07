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
  
  func test_subscript_ClosedRange_wrongRange_returnsExpected() {
    // given
    let expected = ""
    
    // when
    let str = "12345678"
    let result1 = str[-3...5]
    let result2 = str[0...20]
    let result3 = str[4...20]

    // then
    XCTAssertEqual(result1, expected)
    XCTAssertEqual(result2, expected)
    XCTAssertEqual(result3, expected)
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
  
  func test_subscript_halfOpenRange_wrongRange_returnsExpected() {
    // given
    let expected = ""
    
    // when
    let str = "12345678"
    let result1 = str[-3..<5]
    let result2 = str[-5..<7]
    let result3 = str[0..<20]
    let result4 = str[4..<20]

    // then
    XCTAssertEqual(result1, "12345")
    XCTAssertEqual(result2, "1234567")
    XCTAssertEqual(result3, expected)
    XCTAssertEqual(result4, expected)
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
  
  func test_subscript_PartialRangeFrom_wrongRange_returnsExpected() {
    // given
    let expected = ""
    
    // when
    let str = "12345678"
    let result = str[9...]
    let result1 = str[(-5)...]
    
    // then
    XCTAssertEqual(result, expected)
    XCTAssertEqual(result1, expected)
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
  
  func test_subscript_PartialRangeThrough_wrongRange_returnsExpected() {
    // given
    let expected = ""
    
    // when
    let str = "12345678"
    let result = str[...(-5)]
    let result1 = str[...(20)]

    
    // then
    XCTAssertEqual(result, expected)
    XCTAssertEqual(result1, expected)
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
  
  func test_subscript_PartialRangeUpTo_wrongRange_returnsExpected() {
    // given
    let expected = ""
    
    // when
    let str = "12345678"
    let result = str[..<(-5)]
    let result1 = str[..<20]

    // then
    XCTAssertEqual(result, expected)
    XCTAssertEqual(result1, expected)

  }
  
}
