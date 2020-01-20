//
//  Optional+TransformTests.swift
//  SwiftWingsTests
//
//  Created by leacode on 2020/1/20.
//  Copyright © 2020 Leacode. All rights reserved.
//

import XCTest
@testable import SwiftWings

class Optional_TransformTests: XCTestCase {
  
  func test_String_NilCoalescingPrecedence_returnsExpected() {
    
    let aString: String? = nil
    let aData: Data? = nil
    let aNotNullString: String? = "abc"
    
    XCTAssertEqual(aString ??? "str", "str")
    XCTAssertEqual(aData ??? "str", "str")
    XCTAssertEqual(aNotNullString ??? "str", "abc")
    
  }
  
}
