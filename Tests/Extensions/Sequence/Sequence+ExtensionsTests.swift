//
//  Sequence+ExtensionsTests.swift
//  SwiftWingsTests
//
//  Created by leacode on 2020/2/29.
//  Copyright © 2020 Leacode. All rights reserved.
//

import XCTest
@testable import SwiftWings

class Sequence_ExtensionsTests: XCTestCase {
  
  func test_Sequence_unique_returnsExpected() {
    let result = [1, 2, 2, 3, 3, 4, 5, 6, 7, 7].unique()
    let expectedResult = [1, 2, 3, 4, 5, 6, 7]
    XCTAssertEqual(result, expectedResult)
    
    let result1 = ["a", "b", "c", "c", "c", "e", "f", "f", "ab", "ab", "ef"].unique()
    let expectedResult1 = ["a", "b", "c", "e", "f", "ab", "ef"]
    XCTAssertEqual(result1, expectedResult1)
  }
  
}
