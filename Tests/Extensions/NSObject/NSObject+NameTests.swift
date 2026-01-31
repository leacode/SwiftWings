//
//  NSObject+NameTests.swift
//  SwiftWingsTests
//
//  Created by leacode on 2020/1/3.
//  Copyright © 2020 Leacode. All rights reserved.
//

@testable import SwiftWings
import XCTest

class NSObject_NameTests: XCTestCase {
  
  class NSObjectClass: NSObject {}
  
  func test_className_returnsExpected() {
    // given
    let expected = "NSObjectClass"
    
    // when
    let aClass = NSObjectClass()
    let className = aClass.className
    
    // then
    XCTAssertEqual(className, expected)
  }
  
  func test_class_className_returnExpected() {
    // given
    let expected = "NSObjectClass"
    
    // when
    #if os(macOS)
    let className = NSObjectClass.className()
    #else
    let className = NSObjectClass.className
    #endif
    
    // then
    XCTAssertEqual(className, expected)
  }
  
}
