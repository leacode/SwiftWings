//
//  String+MD5Tests.swift
//  SwiftWingsTests
//
//  Created by leacode on 2020/1/8.
//  Copyright © 2020 Leacode. All rights reserved.
//

import XCTest
@testable import SwiftWings

class String_MD5Tests: XCTestCase {
  
  func test_md5_returnsExpected() {
    let expected = "e10adc3949ba59abbe56e057f20f883e"
    
    let result = "123456".md5
    
    XCTAssertEqual(result, expected)    
  }
  
}
