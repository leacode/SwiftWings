//
//  String+EmojiTests.swift
//  SwiftWingsTests
//
//  Created by leacode on 2020/1/28.
//  Copyright © 2020 Leacode. All rights reserved.
//

import XCTest
@testable import SwiftWings

class String_EmojiTests: XCTestCase {
  
  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func test_String_isSingleEmoji_returnsExpected() {
    XCTAssertTrue("😎".isSingleEmoji)
    XCTAssertTrue("⛓".isSingleEmoji)
    XCTAssertFalse("😎😍".isSingleEmoji)
    XCTAssertFalse("abc".isSingleEmoji)
  }
  
  func test_String_containsOnlyEmoji_returnsExpected() {
    XCTAssertTrue("😎".containsOnlyEmoji)
    XCTAssertTrue("😎😳".containsOnlyEmoji)
    XCTAssertTrue("😎👨🏾‍🦳".containsOnlyEmoji)
    
    XCTAssertFalse("⛿".containsOnlyEmoji)
    XCTAssertFalse("😎↪".containsOnlyEmoji)
    XCTAssertFalse("😎↪⤵#".containsOnlyEmoji)
    XCTAssertFalse("😎↪⤵#😎↪".containsOnlyEmoji)
    XCTAssertFalse("#".containsOnlyEmoji)
    XCTAssertFalse("0xFE0F".containsOnlyEmoji)
    XCTAssertFalse("😎😍aca".containsOnlyEmoji)
    XCTAssertFalse("abc😎😍aca".containsOnlyEmoji)
    XCTAssertFalse("abc😎adsfa😍aca".containsOnlyEmoji)
    XCTAssertFalse("abc".containsOnlyEmoji)
    XCTAssertFalse("".containsOnlyEmoji)
    
    print("abc")
    
    print(String(UnicodeScalar(0x200D)!) + "abc")
    
//    XCTAssertNotEqual(String(UnicodeScalar(0xFE0F)!), String(UnicodeScalar(0xFE0F)!))
    
  }
  func test_String_containsEmoji_returnsExpected() {
    XCTAssertTrue("11sss👽431fas".containsEmoji)
    XCTAssertTrue("1👽☝🏽💪".containsEmoji)
    XCTAssertTrue("1adf⛓afdasf".containsEmoji)
    XCTAssertFalse("12345678AFJDAISOFOADS".containsEmoji)
  }
  
  func test_String_trimmingEmojis_returnsExpected() {
    XCTAssertEqual("👧🏼abc👨🏾‍🦳fadsf🕵🏻‍♀️adsf👳🏾‍♀️".trimmingEmojis, "abcfadsfadsf")
    XCTAssertEqual("abc👨🏾‍🦳fadsf🕵🏻‍♀️adsf".trimmingEmojis, "abcfadsfadsf")
  }
  
}
