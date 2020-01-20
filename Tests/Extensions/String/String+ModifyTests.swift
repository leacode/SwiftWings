//
//  String+ModifyTests.swift
//  SwiftWingsTests
//
//  Created by leacode on 2020/1/15.
//  Copyright © 2020 Leacode. All rights reserved.
//

@testable import SwiftWings
import XCTest

class String_ModifyTests: XCTestCase {
  func test_String_vowels_returnsExpected() {
    XCTAssertEqual(String.vowels, ["a", "e", "i", "o", "u"])
  }
  
  func test_String_consonants_returnsExpected() {
    let consonants = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "z"]
    XCTAssertEqual(String.consonants, consonants)
  }
  
  func test_String_pluralize_returnsExpected() {
    XCTAssertEqual("".pluralize(0), "")
    XCTAssertEqual("".pluralize(1), "")
    XCTAssertEqual("".pluralize(2), "")
    
    XCTAssertEqual("a".pluralize(0), "a")
    XCTAssertEqual("a".pluralize(1), "a")
    XCTAssertEqual("a".pluralize(2), "a")
    
    XCTAssertEqual("Reply".pluralize(0), "Reply")
    XCTAssertEqual("Reply".pluralize(1), "Reply")
    XCTAssertEqual("Reply".pluralize(2), "Replies")
    XCTAssertEqual("REPLY".pluralize(3), "REPLIES")
    XCTAssertEqual("Horse".pluralize(2), "Horses")
    XCTAssertEqual("Boy".pluralize(2), "Boys")
    XCTAssertEqual("Cut".pluralize(2), "Cuts")
    XCTAssertEqual("Boss".pluralize(2), "Bosses")
    XCTAssertEqual("Domino".pluralize(2), "Dominoes")
    
    XCTAssertEqual("product".pluralize(0), "product")
    XCTAssertEqual("product".pluralize(1), "product")
    XCTAssertEqual("product".pluralize(2), "products")
    XCTAssertEqual("product".pluralize(3), "products")
    
    XCTAssertEqual("furniture".pluralize(3, countable: false), "furniture")
  }
  
  func testMatch() {
    let sRegex = #"^[a-z|A-Z|0-9]+[^S]\s?(s{1}|S{1})$"#
    
    XCTAssertTrue("apples".matches(pattern: sRegex))
    XCTAssertTrue("34fqsdfs".matches(pattern: sRegex))
    XCTAssertTrue("appleS".matches(pattern: sRegex))
    XCTAssertFalse("appleSS".matches(pattern: sRegex))
    XCTAssertFalse("apple".matches(pattern: sRegex))
    
    let feRegex = #"^[a-z|A-Z|0-9]+[^S]\s?(f{1}|fe{1})$"#
    XCTAssertTrue("wife".matches(pattern: feRegex))
    XCTAssertTrue("wolf".matches(pattern: feRegex))
    
    let consonantAndYRegex = #"^[a-z|A-Z|0-9]+[bddfghjklmnpqrstvxzBCDFGHJKLMNPQRSTVXZ]\s?(y{1}|Y{1})$"#
    
    XCTAssertTrue("city".matches(pattern: consonantAndYRegex))
    XCTAssertTrue("puppy".matches(pattern: consonantAndYRegex))
  }
  
  // Test case is from https://www.grammarly.com/blog/plural-nouns/
  func test_String_plural_returnsExpected() {
    
    XCTAssertEqual("a".plural, "a")
    XCTAssertEqual("A".plural, "A")
    XCTAssertEqual("".plural, "")

    
    XCTAssertEqual("cat".plural, "cats")
    XCTAssertEqual("house".plural, "houses")
    
    XCTAssertEqual("truss".plural, "trusses")
    XCTAssertEqual("bus".plural, "busses")
    XCTAssertEqual("marsh".plural, "marshes")
    XCTAssertEqual("lunch".plural, "lunches")
    XCTAssertEqual("tax".plural, "taxes")
    XCTAssertEqual("blitz".plural, "blitzes")
    
    XCTAssertEqual("fez".plural, "fezzes")
    XCTAssertEqual("gas".plural, "gasses")
    
    XCTAssertEqual("wife".plural, "wives")
    XCTAssertEqual("wolf".plural, "wolves")
    
    XCTAssertEqual("roof".plural, "roofs")
    XCTAssertEqual("belief".plural, "beliefs")
    XCTAssertEqual("chef".plural, "chefs")
    XCTAssertEqual("chief".plural, "chiefs")
    
    XCTAssertEqual("city".plural, "cities")
    XCTAssertEqual("puppy".plural, "puppies")
    
    XCTAssertEqual("ray".plural, "rays")
    XCTAssertEqual("boy".plural, "boys")
    
    XCTAssertEqual("potato".plural, "potatoes")
    XCTAssertEqual("tomato".plural, "tomatoes")
    XCTAssertEqual("photo".plural, "photos")
    XCTAssertEqual("piano".plural, "pianos")
    XCTAssertEqual("halo".plural, "halos")
    
    // Upper Cases
    
    XCTAssertEqual("CAT".plural, "CATS")
    XCTAssertEqual("HOUSE".plural, "HOUSES")
    
    XCTAssertEqual("TRUSS".plural, "TRUSSES")
    XCTAssertEqual("BUS".plural, "BUSSES")
    XCTAssertEqual("MARSH".plural, "MARSHES")
    XCTAssertEqual("LUNCH".plural, "LUNCHES")
    XCTAssertEqual("TAX".plural, "TAXES")
    XCTAssertEqual("BLITZ".plural, "BLITZES")
    
    XCTAssertEqual("FEZ".plural, "FEZZES")
    XCTAssertEqual("GAS".plural, "GASSES")
    
    XCTAssertEqual("WIFE".plural, "WIVES")
    XCTAssertEqual("WOLF".plural, "WOLVES")
    
    XCTAssertEqual("ROOF".plural, "ROOFS")
    XCTAssertEqual("BELIEF".plural, "BELIEFS")
    XCTAssertEqual("CHEF".plural, "CHEFS")
    XCTAssertEqual("CHIEF".plural, "CHIEFS")
    
    XCTAssertEqual("CITY".plural, "CITIES")
    XCTAssertEqual("PUPPY".plural, "PUPPIES")
    
    XCTAssertEqual("RAY".plural, "RAYS")
    XCTAssertEqual("BOY".plural, "BOYS")
    
    XCTAssertEqual("POTATO".plural, "POTATOES")
    XCTAssertEqual("TOMATO".plural, "TOMATOES")
    XCTAssertEqual("PHOTO".plural, "PHOTOS")
    XCTAssertEqual("PIANO".plural, "PIANOS")
    XCTAssertEqual("HALO".plural, "HALOS")
  }
}
