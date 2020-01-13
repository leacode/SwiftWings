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
    XCTAssertEqual(FileType(pathOrFileName: path).rawValue, "text/html")
    
    let fileName = "index.html"
    XCTAssertEqual(FileType(pathOrFileName: fileName).rawValue, "text/html")
    
    let noExtensionFilePath = "leacode/index"
    XCTAssertEqual(FileType(pathOrFileName: noExtensionFilePath).rawValue, "unknown")
    
    let noExtensionFileName = "index"
    XCTAssertEqual(FileType(pathOrFileName: noExtensionFileName).rawValue, "unknown")
  }
  
  func test_MimeType_ExpressibleByStringLiteral_init() {
    
    let htmlMimeType = FileType(stringLiteral: "text/html")
    XCTAssertEqual(htmlMimeType, FileType.html)
    
    let unknownType = FileType(stringLiteral: "xxx")
    XCTAssertEqual(unknownType, FileType.unknown)
    
  }
  
}
