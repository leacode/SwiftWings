//
//  Mirror+ReflectionTests.swift
//  SwiftWingsTests
//
//  Created by leacode on 2020/1/14.
//  Copyright © 2020 Leacode. All rights reserved.
//

import XCTest
@testable import SwiftWings

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
  
  func invoke () throws {
    var reflected: Bool = false
    Mirror.reflectProperties(of: self) { (obj: TestProtocol) in
      reflected = true
    }
    
    if reflected == false {
      throw MachError(.failure)
    }
    
  }
  
  func invokeRecursively() throws {
    var reflected: Bool = false
    Mirror
      .reflectProperties(of: self,
                         recursively: true)
      { (obj: TestProtocol) in
      reflected = true
    }
    
    if reflected == false {
      throw MachError(.failure)
    }
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
    for _ in 0...1000 {
      try testMirrorClass.invoke()
      try testMirrorClass.invokeRecursively()
    }
  }
  
  func test_InvokeDirectly() {
    XCTAssertEqual(testMirrorClass.invokeDirectly(), true)
  }
  
}
