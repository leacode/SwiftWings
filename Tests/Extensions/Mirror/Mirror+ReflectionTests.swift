//
//  Mirror+ReflectionTests.swift
//  SwiftWingsTests
//
//  Created by leacode on 2020/1/14.
//  Copyright © 2020 Leacode. All rights reserved.
//

@testable import SwiftWings
import XCTest

protocol TestProtocol {
  func invokeFunction() -> Bool
}

class TestClass1: TestProtocol {
  func invokeFunction() -> Bool {
    return true
  }
}

class TestClass2: TestProtocol {
  func invokeFunction() -> Bool {
    return true
  }
}

class TestClass3: TestProtocol {
  func invokeFunction() -> Bool {
    return true
  }
}

class TestMirrorClass {
  var class1 = TestClass1()
  var class2 = TestClass2()
  var class3 = TestClass3()
  
  func invokeDirectly() -> Bool {
    return class1.invokeFunction() &&
      class2.invokeFunction() &&
      class3.invokeFunction()
  }
  
  func invoke() -> Bool {
    var reflected: Bool = false
    Mirror.reflectProperties(of: self) { (_: TestProtocol) in
      reflected = true
    }
    
    return reflected
  }
  
  func invokeRecursively() -> Bool {
    var reflected: Bool = false
    Mirror
      .reflectProperties(of: self,
                         recursively: true) { (_: TestProtocol) in
                          reflected = true
    }
    
    return reflected
  }
}

class Mirror_ReflectionTests: XCTestCase {
  var testMirrorClass: TestMirrorClass!
  
  override func setUp() {
    super.setUp()
    
    testMirrorClass = TestMirrorClass()
  }
  
  override func tearDown() {
    testMirrorClass = nil
    
    super.tearDown()
  }
  
  func test_Mirror_reflectProperties() throws {
    for _ in 0 ... 1000 {
      XCTAssertTrue(testMirrorClass.invoke())
      XCTAssertTrue(testMirrorClass.invokeRecursively())
    }
  }
  
  func test_InvokeDirectly() {
    XCTAssertEqual(testMirrorClass.invokeDirectly(), true)
  }
}
