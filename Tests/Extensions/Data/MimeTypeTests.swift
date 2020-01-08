//
//  MimeTypeTests.swift
//  SwiftWingsTests
//
//  Created by leacode on 2020/1/8.
//  Copyright © 2020 Leacode. All rights reserved.
//

import XCTest
@testable import SwiftWings

class MimeTypeTests: XCTestCase {
  
  func test_MimeType_init() {
    let path = "/leacode/index.html"
    XCTAssertEqual(MimeType(pathOrFileName: path).rawValue, "text/html")
    
    let fileName = "index.html"
    XCTAssertEqual(MimeType(pathOrFileName: fileName).rawValue, "text/html")
    
    let noExtensionFilePath = "leacode/index"
    XCTAssertEqual(MimeType(pathOrFileName: noExtensionFilePath).rawValue, "unknown")
    
    let noExtensionFileName = "index"
    XCTAssertEqual(MimeType(pathOrFileName: noExtensionFileName).rawValue, "unknown")
  }
  
  func test_MimeType_ExpressibleByStringLiteral_init() {
    
    let htmlMimeType = MimeType(stringLiteral: "text/html")
    XCTAssertEqual(htmlMimeType, MimeType.html)
    
    let unknownType = MimeType(stringLiteral: "xxx")
    XCTAssertEqual(unknownType, MimeType.unknown)
    
  }
  
}
