//
//  String+Modify.swift
//  SwiftWings
//
//  Created by leacode on 2020/1/15.
//  Copyright © 2020 Leacode. All rights reserved.
//

import Foundation

public extension String {
  
  /// characteristics of vowels
  static var vowels: [String] {
    return ["a", "e", "i", "o", "u"]
  }
  
  /// characteristics of consonants
  static var consonants: [String] {
    return ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "z"]
  }
  
  /// exceptions plural format
  private var pluralExceptions: [String: String] {
    return [
      "roof": "roofs",
      "belief": "beliefs",
      "chef": "chefs",
      "chief": "chiefs",
      "photo": "photos",
      "piano": "pianos",
      "halo": "halos",
    ]
  }
    
  /// return normal form or plural form of a noun
  /// - Parameter count: count of object
  func pluralize(_ count: Int, countable: Bool = true) -> String {
    if countable == false { return self }
    if count == 1 || count == 0 { return self }
    if self.count == 1 || self.count == 0 { return self }
    
    if pluralExceptions.keys.contains(where: { $0 == self.lowercased() }) {
      if self == self.uppercased() {
        return pluralExceptions[self.lowercased()]!.uppercased()
      }
      return pluralExceptions[self.lowercased()]!
    }
    
    var prefix = "", suffix = ""
    
    // noun ends with f/F
    let fRegex = #"^[a-z|A-Z|0-9]+[^Ss](f{1}|F{1})$"#
    // noun ends with fe/FE
    let feRegex = #"^[a-z|A-Z|0-9]+(fe{1}|FE{1})$"#
    // noun ends with s/S
    let sRegex = #"^[a-z|A-Z|0-9]+[^Ss](s{1}|S{1})$"#
    // noun ends with o/O
    let oRegex = #"^[a-z|A-Z|0-9]+(o{1}|O{1})$"#
    // noun ends with y/Y
    let yRegex = #"^[a-z|A-Z|0-9]+[aeiouAEIOU](y{1}|Y{1})$"#
    // noun ends with consonant and y/Y
    let consonantAndYRegex = #"^[a-z|A-Z|0-9]+[bddfghjklmnpqrstvxzBCDFGHJKLMNPQRSTVXZ](y{1}|Y{1})$"#
    // noun ends with sh/SH
    let shRegex = #"^[a-z|A-Z|0-9]+(sh{1}|SH{1})$"#
    // noun ends with ss/SS
    let ssRegex = #"^[a-z|A-Z|0-9]+(ss{1}|SS{1})$"#
    // noun ends with vowels and s/S
    let vowelsAndSRegex = #"^[a-z|A-Z|0-9]+[aeiouAEIOU](s{1}|S{1})$"#
    // noun ends with vowels and z/Z
    let vowelsAndZRegex = #"^[a-z|A-Z|0-9]+[aeiouAEIOU](z{1}|Z{1})$"#
    // noun ends with ch/CH
    let chRegex = #"^[a-z|A-Z|0-9]+(ch{1}|CH{1})$"#
    // noun ends with x/X
    let xRegex = #"^[a-z|A-Z|0-9]+[aeiouAEIOU](x{1}|X{1})$"#
    // noun ends with tz/TZ
    let tzRegex = #"^[a-z|A-Z|0-9]+[^Oo](tz{1}|TZ{1})$"#
    
    let lastCharacter = String(last!)
    
    if matches(pattern: vowelsAndZRegex) {
      prefix = self[0 ..< self.count]
      suffix = "zes"
    } else if matches(pattern: vowelsAndSRegex) {
      prefix = self[0 ..< self.count]
      suffix = "ses"
    } else if matches(pattern: sRegex) || matches(pattern: oRegex) || matches(pattern: xRegex) {
      prefix = self[0 ..< self.count]
      suffix = "es"
    } else if matches(pattern: shRegex) ||
      matches(pattern: ssRegex) ||
      matches(pattern: chRegex) ||
      matches(pattern: tzRegex) {
      prefix = self[0 ..< self.count]
      suffix = "es"
    } else if matches(pattern: yRegex) {
      prefix = self[0 ..< self.count]
      suffix = "s"
    } else if matches(pattern: consonantAndYRegex) {
      prefix = self[0 ..< self.count - 1]
      suffix = "ies"
    } else if matches(pattern: fRegex) {
      prefix = self[0 ..< self.count - 1]
      suffix = "ves"
    } else if matches(pattern: feRegex) {
      prefix = self[0 ..< self.count - 2]
      suffix = "ves"
    } else {
      prefix = self[0 ..< self.count]
      suffix = "s"
    }
    
    return prefix + (lastCharacter != lastCharacter.uppercased() ? suffix : suffix.uppercased())
  }
  
  /// plural of the string
  var plural: String {
    return pluralize(2)
  }
}
