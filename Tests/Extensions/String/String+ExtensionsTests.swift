//
//  String+ExtensionsTests.swift
//  SwiftWingsTests
//
//  Created by leacode on 2020/9/18.
//  Copyright © 2020 Leacode. All rights reserved.
//

import XCTest
@testable import SwiftWings

class String_ExtensionsTests: XCTestCase {
  
  func test_String_asURL_returnsExpected() throws {
    let url1 = "https://www.baidu.com"
    let url2 = "fasdjfapsoifjadsof"
    XCTAssertEqual(url1.asURL, URL(string: url1))
    XCTAssertNotNil(url2.asURL)
    XCTAssertEqual(url2.asURL, URL(string: url2))
  }
  
  func test_String_asDict_returnsExpected() throws {
    let str = """
    {"name": "Leacode", "age": 32, "gendar": "male", "married": true}
    """
    XCTAssertNotNil(str.asDict)
    
    let str1 = "fadjfiaosf"
    XCTAssertNil(str1.asDict)
  }
  
  func test_String_asArray_returnsExpected() throws {
    let str = """
    [{"name": "Tom"}, {"name": "Jerry"}]
    """
    XCTAssertNotNil(str.asArray)
    
    let str1 = "fadjfiaosf"
    XCTAssertNil(str1.asArray)
  }
  
  func test_String_localized_returnsExpected() throws {
    XCTAssertEqual("Hello".localized, "Hello")
  }
  
  func test_String_init_returnsExpected() {
    
    let jsonObj: [String: Any] = [
      "name": "Leacode",
      "age": 32,
      "gendar": "male",
      "married": true
    ]
    
    XCTAssertNotNil(String(json: jsonObj))
  }
  
  func test_String_jsonToDictionary_returnsExpected() {
    let json = """
    {"name": "Leacode", "age": 32, "gendar": "male", "married": true}
    """
    XCTAssertNotNil(json.jsonToDictionary())
  }
  
  func test_String_jsonToArray_returnsExpected() {
    let json = """
    [{"name": "Tom"}, {"name": "Jerry"}]
    """
    XCTAssertNotNil(json.jsonToArray())
  }
  
}
