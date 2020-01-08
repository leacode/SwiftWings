//
//  Data+MimeTypeTests.swift
//  SwiftWingsTests
//
//  Created by leacode on 2020/1/8.
//  Copyright © 2020 Leacode. All rights reserved.
//

import XCTest
@testable import SwiftWings

class Data_MimeTypeTests: XCTestCase {
  
  func test_Data_isAmr_returnsExpected() throws {
    let amrFileData = try Data.fromFile(fileName: "amrFile", extensionName: "amr")
    XCTAssertTrue(amrFileData.isAmr)
    
    let wavFileData = try Data.fromFile(fileName: "wavFile", extensionName: "wav")
    XCTAssertFalse(wavFileData.isAmr)
  }
  
}
