//
//  AudioMimeTypeTests.swift
//  SwiftWingsTests
//
//  Created by leacode on 2020/1/8.
//  Copyright © 2020 Leacode. All rights reserved.
//

import XCTest
@testable import SwiftWings

class AudioMimeTypeTests: XCTestCase {
  
  func test_AudioMimeType_ExpressibleByStringLiteral_init() {
    let amrAudioMimeType = AudioMimeType(stringLiteral: "audio/amr")
    XCTAssertEqual(amrAudioMimeType, AudioMimeType.amr)
    
    let unknownType = AudioMimeType(stringLiteral: "xxx")
    XCTAssertEqual(unknownType, AudioMimeType.unknown)
  }
  
}
