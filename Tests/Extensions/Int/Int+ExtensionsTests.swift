//
//  Int+ExtensionsTests.swift
//  SwiftWingsTests
//
//  Created by leacode on 2020/1/8.
//  Copyright © 2020 Leacode. All rights reserved.
//

import XCTest
@testable import SwiftWings

class Int_ExtensionsTests: XCTestCase {
  
  func test_simplifiedChinese_rerurnsExpected() {
    
    XCTAssertEqual(1.simplifiedChinese, "一")
    XCTAssertEqual(12.simplifiedChinese, "十二")
    XCTAssertEqual(123.simplifiedChinese, "一百二十三")
    XCTAssertEqual(1234.simplifiedChinese, "一千二百三十四")
    XCTAssertEqual(123456.simplifiedChinese, "十二万三千四百五十六")
    XCTAssertEqual(1234567.simplifiedChinese, "一百二十三万四千五百六十七")
    XCTAssertEqual(12345678.simplifiedChinese, "一千二百三十四万五千六百七十八")
    XCTAssertEqual(123456789.simplifiedChinese, "一亿二千三百四十五万六千七百八十九")
    XCTAssertEqual(1234567890.simplifiedChinese, "十二亿三千四百五十六万七千八百九十")
    XCTAssertEqual(12345678900.simplifiedChinese, "一百二十三亿四千五百六十七万八千九百")
    XCTAssertEqual(123456789000.simplifiedChinese, "一千二百三十四亿五千六百七十八万九千")
    XCTAssertEqual(1234567890000.simplifiedChinese, "一兆二千三百四十五亿六千七百八十九万")
    
  }
  func test_traditionalChinese_rerurnsExpected() {
    
    XCTAssertEqual(1.traditionalChinese, "一")
    XCTAssertEqual(12.traditionalChinese, "十二")
    XCTAssertEqual(123.traditionalChinese, "一百二十三")
    XCTAssertEqual(1234.traditionalChinese, "一千二百三十四")
    XCTAssertEqual(123456.traditionalChinese, "十二萬三千四百五十六")
    XCTAssertEqual(1234567.traditionalChinese, "一百二十三萬四千五百六十七")
    XCTAssertEqual(12345678.traditionalChinese, "一千二百三十四萬五千六百七十八")
    XCTAssertEqual(123456789.traditionalChinese, "一億二千三百四十五萬六千七百八十九")
    XCTAssertEqual(1234567890.traditionalChinese, "十二億三千四百五十六萬七千八百九十")
    XCTAssertEqual(12345678900.traditionalChinese, "一百二十三億四千五百六十七萬八千九百")
    XCTAssertEqual(123456789000.traditionalChinese, "一千二百三十四億五千六百七十八萬九千")
    XCTAssertEqual(1234567890000.traditionalChinese, "一兆二千三百四十五億六千七百八十九萬")
    
  }
  
  func test_half_returnsExpected() {
    XCTAssertEqual(4.half, 2)
    XCTAssertEqual(5.half, 2)
  }
  
  func test_isEven_returnsExpected() {
    XCTAssertTrue(2.isEven)
    XCTAssertTrue(4.isEven)
    
    XCTAssertFalse(5.isEven)
  }
  
  func test_toDouble_returnsExpected() {
    XCTAssertEqual(1.toDouble(), Double(1))
    XCTAssertEqual(133232.toDouble(), Double(133232))
    XCTAssertEqual(-21211.toDouble(), Double(-21211))
    XCTAssertEqual(0.toDouble(), Double(0))
  }
  
  func test_toString_returnsExpected() {
    XCTAssertEqual(123.toString(), "123")
  }
  
}
