//
//  Data+PrettyJSONTests.swift
//  SwiftWingsTests
//
//  Created by leacode on 2020/1/20.
//  Copyright © 2020 Leacode. All rights reserved.
//

import XCTest

class Data_PrettyJSONTests: XCTestCase {
  
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
  
  func test_Data_prettyJSONString_returnsExpected() throws {
    let data = try JSONEncoder().encode(model)
    XCTAssertNotNil(data.prettyJSONString)
        
    let otherData = try Data.fromFile(fileName: "tiffFile", extensionName: "tiff")
    XCTAssertNil(otherData.prettyJSONString)
  }

}
