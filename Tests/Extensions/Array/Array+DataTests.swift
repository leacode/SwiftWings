//
//  Array+DataTests.swift
//  SwiftWingsTests
//
//  Created by leacode on 2020/1/20.
//  Copyright © 2020 Leacode. All rights reserved.
//

import XCTest
@testable import SwiftWings

class Array_DataTests: XCTestCase {

  func test_Array_data_returnsExpected() {
    let uint8Array: [UInt8] = [UInt8(5), UInt8(7), UInt8(2), UInt8(4)]
    XCTAssertEqual(uint8Array.data.bytes.count, 4)
  }

}
