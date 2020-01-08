//
//  Data+File.swift
//  SwiftWingsTests
//
//  Created by leacode on 2020/1/8.
//  Copyright © 2020 Leacode. All rights reserved.
//

import Foundation
import XCTest

extension Data {
  
  public static func fromFile(fileName: String,
                              extensionName: String? = nil,
                              file: StaticString = #file,
                              line: UInt = #line) throws -> Data {
    
    let bundle = Bundle(for: TestBundleClass.self)
    let url = try XCTUnwrap(bundle.url(forResource: fileName, withExtension: extensionName),
                            "Unable to find \(fileName).\(extensionName ?? ""). Did you add it to the tests?",
      file: file, line: line)
    return try Data(contentsOf: url)
  }
}

private class TestBundleClass { }
