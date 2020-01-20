//
//  Codable+JSONTests.swift
//  SwiftWingsTests
//
//  Created by leacode on 2020/1/20.
//  Copyright © 2020 Leacode. All rights reserved.
//

import XCTest

class Codable_JSONTests: XCTestCase {
  
  var model: CodableModel!
  var invalidModel: CodableModel!
  
  override func setUp() {
    super.setUp()
    
    model = CodableModel(name: "name", number: 1, date: Date(), price: 5.20)
    invalidModel = CodableModel(name: "name", number: 1, date: Date(), price: Double.infinity)
  }
  
  override func tearDown() {
    model = nil
    invalidModel = nil
    super.tearDown()
  }
  
  func test_Codable_jsonString_returnsExpected() {
    let jsonStr = model.jsonString
    XCTAssertNotNil(jsonStr)
    
    XCTAssertNil(invalidModel.jsonString)
  }
  
  func test_Codable_dictionary_returnsExpected() throws {
    let dict = try? model.dictionary()
    XCTAssertNotNil(dict)
    XCTAssertTrue(dict?.count ?? 0 > 0)
    
    let invalidResult = try? invalidModel.dictionary()
    XCTAssertNil(invalidResult)
    XCTAssertThrowsError(try invalidModel.dictionary())
  }
  
}
