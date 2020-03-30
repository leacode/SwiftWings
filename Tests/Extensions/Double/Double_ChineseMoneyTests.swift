//
//  Double_ChineseMoneyTests.swift
//  SwiftWings
//
//  Created by leacode on 2020/3/30.
//  Copyright © 2020 Leacode. All rights reserved.
//

import XCTest
@testable import SwiftWings

class Double_ChineseMoneyTests: XCTestCase {
  
  func test_Double_chineseMoneySpell_returnsExpected() {
    XCTAssertEqual(3213213.21.chineseMoneySpell, "叁佰贰拾壹万叁仟贰佰壹拾叁圆贰角壹分")
    XCTAssertEqual(0.56.chineseMoneySpell, "伍角陆分")
    XCTAssertEqual(0.5678.chineseMoneySpell, "伍角柒分")
    XCTAssertEqual(123456.chineseMoneySpell, "壹拾贰万叁仟肆佰伍拾陆圆整")
    XCTAssertEqual(123456789.chineseMoneySpell, "壹亿贰仟叁佰肆拾伍万陆仟柒佰捌拾玖圆整")
    XCTAssertEqual(123456.5.chineseMoneySpell, "壹拾贰万叁仟肆佰伍拾陆圆伍角")
    XCTAssertEqual(123456.55.chineseMoneySpell, "壹拾贰万叁仟肆佰伍拾陆圆伍角伍分")
    XCTAssertEqual(123456.05.chineseMoneySpell, "壹拾贰万叁仟肆佰伍拾陆圆零伍分")
  }
  
}
