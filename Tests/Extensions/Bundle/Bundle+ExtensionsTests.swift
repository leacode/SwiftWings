//
//  Bundle+ExtensionsTests.swift
//  SwiftWingsTests
//
//  Created by leacode on 2020/9/25.
//  Copyright © 2020 Leacode. All rights reserved.
//

import XCTest
@testable import SwiftWings

class Bundle_ExtensionsTests: XCTestCase {
  
  private let bundle = Bundle(for: SomeClass.self)
  
  func test_appVersions_returnsExpected() {
    XCTAssertNotNil(bundle.appVersion)
  }
  
}
