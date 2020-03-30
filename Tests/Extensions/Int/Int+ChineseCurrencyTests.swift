//
//  Int+ChineseCurrencyTests.swift
//  SwiftWingsTests
//
//  Created by leacode on 2020/3/30.
//  Copyright © 2020 Leacode. All rights reserved.
//

import XCTest

class Int_ChineseCurrencyTests: XCTestCase {

    func test_Int_chineseMoneySpell_returnsExpected() {
      XCTAssertEqual(Int(123456).chineseMoneySpell, "壹拾贰万叁仟肆佰伍拾陆圆整")
      XCTAssertEqual(Int(123456789).chineseMoneySpell, "壹亿贰仟叁佰肆拾伍万陆仟柒佰捌拾玖圆整")
    }

}
