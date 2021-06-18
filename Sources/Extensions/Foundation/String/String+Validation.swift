//
//  String+Validation.swift
//  SwiftWingsTests
//
//  Created by leacode on 2020/1/6.
//  Copyright © 2020 Leacode. All rights reserved.
//

import Foundation

public extension String {
  /// A Boolean value indicating whether a string contains phone number.
  var containsPhoneNumber: Bool {
    contains(types: .phoneNumber)
  }
  
  /// A Boolean value indicating whether a string contains link.
  var containsLink: Bool {
    contains(types: .link)
  }
  
  /// A Boolean value indicating whether a string contains Address.
  var containsAddress: Bool {
    contains(types: .address)
  }
  
  /// check if string contains certain Checking Type
  ///
  /// - Parameter types: NSTextCheckingResult.CheckingType
  /// - Returns: whether contains type
  func contains(types: NSTextCheckingResult.CheckingType) -> Bool {
    let detector = try! NSDataDetector(types: types.rawValue)
    let matches = detector.matches(in: self, options: .reportCompletion, range: NSMakeRange(0, count))
    return matches.count > 0
  }
  
  /// 严格意义上包含电话号码
  var strictContainsPhoneNumber: Bool {
    return westernArabicNumeralsOnly.containsPhoneNumber
  }
  
  /// A Boolean value indicating whether a string is valid email address.
  var isValidEmail: Bool {
    let emailRegEx = #"^(?:[\p{L}0-9!#$%\&'*+/=?\^_`{|}~-]+(?:\.[\p{L}0-9!#$%\&'*+/=?\^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[\p{L}0-9](?:[a-z0-9-]*[\p{L}0-9])?\.)+[\p{L}0-9](?:[\p{L}0-9-]*[\p{L}0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[\p{L}0-9-]*[\p{L}0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])$"#
    
    return matches(pattern: emailRegEx)
  }
  
  /// A Boolean value indicating whether a string is valid phone number.
  var isValidPhoneNumber: Bool {
    let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
    let matches = detector.matches(in: self, options: [], range: NSMakeRange(0, count))
    if let res = matches.first {
      return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == count
    }
    return false
  }
  
  /// A Boolean value indicating whether a string is valid JSON String.
  var isValidJSON: Bool {
    if let jsonDataToVerify = self.data(using: String.Encoding.utf8),
       let _ = try? JSONSerialization.jsonObject(with: jsonDataToVerify) {
      return true
    }
    return false
  }
  
  /// A Boolean value indicating whether a string is a UUID String.
  var isUUID: Bool {
    UUID(uuidString: self) != nil
  }
  
  /// A Boolean value indicating whether a string is a Int String.
  var isInt: Bool {
    Int(self) != nil
  }
  
  /// A Boolean value indicating whether a string is a Double String.
  var isDouble: Bool {
    Double(self) != nil
  }
  
  /// A Boolean value indicating whether a string is a Float String.
  var isFloat: Bool {
    Float(self) != nil
  }
  
  /// A Boolean value indicating whether a string is valid Chinese ID card number String.
  var isValidChineseIDCardNo: Bool {
    // 判断是否为空
    if count <= 0 { return false }
    
    // 判断是否是18位，末尾是否是x
    let regex = "^(\\d{14}|\\d{17})(\\d|[xX])$"
    if !matches(pattern: regex) { return false }
    
    // 判断生日是否合法
    let from = index(startIndex, offsetBy: 6)
    let to = index(from, offsetBy: 7)
    let dateStr = String(self[from ... to])
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyyMMdd"
    if formatter.date(from: dateStr) == nil { return false }
    
    // 判断校验位
    if count == 18 {
      // 将前17位加权因子保存在数组里
      let idCardWi = ["7", "9", "10", "5", "8", "4", "2", "1", "6", "3", "7", "9", "10", "5", "8", "4", "2"]
      // 这是除以11后，可能产生的11位余数、验证码，也保存成数组
      let idCardY = ["1", "0", "10", "9", "8", "7", "6", "5", "4", "3", "2"]
      var idCardWiSum: Int = 0 // 用来保存前17位各自乘以加权因子后的总和
      for i in 0 ..< 17 {
        let startIndex = index(self.startIndex, offsetBy: i)
        let toIndex = index(startIndex, offsetBy: 0)
        idCardWiSum += Int(String(self[startIndex ... toIndex]))! * Int(idCardWi[i])!
      }
      // 计算出校验码所在数组的位置
      let idCardMod: Int = idCardWiSum % 11
      // 得到最后一位身份证号码
      let idCardLast = String(suffix(1))
      // 如果等于2，则说明校验码是10，身份证号码最后一位应该是X
      if idCardMod == 2 {
        return idCardLast == "X" || idCardLast == "x"
      }
      // 用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
      return Int(idCardLast)! == Int(idCardY[idCardMod])!
    }
    return false
  }
  
  /// A Boolean value indicating whether a string is valid Bank Card Number String.
  var isValidBankCardNumber: Bool {
    self.luhnCheck()
  }
  
  /// Luhn Algorithm in Swift.
  func luhnCheck() -> Bool {
    var sum = 0
    let num = self.replacingOccurrences(of: " ", with: "")
    if num.count == 0 { return false }
    let digitStrings = num.reversed().map { String($0) }
    
    for tuple in digitStrings.enumerated() {
      if let digit = Int(tuple.element) {
        let odd = tuple.offset % 2 == 1
        
        switch (odd, digit) {
        case (true, 9):
          sum += 9
        case (true, 0...8):
          sum += (digit * 2) % 9
        default:
          sum += digit
        }
      } else {
        return false
      }
    }
    return sum % 10 == 0
  }
  
  /// check whether a string maches pattern
  ///
  /// - Parameter pattern: 正则表达式字符串
  /// - Returns: 是否满足正则表达式
  func matches(pattern: String) -> Bool {
    let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
    return predicate.evaluate(with: self)
  }
  
  var westernArabicNumeralsOnly: String {
    let pattern = UnicodeScalar("0") ... "9"
    return String(unicodeScalars
                    .compactMap { pattern ~= $0 ? Character($0) : nil })
  }
  
  var containsOnlyDigits: Bool {
    let notDigits = NSCharacterSet.decimalDigits.inverted
    return rangeOfCharacter(from: notDigits, options: String.CompareOptions.literal, range: nil) == nil
  }
  
  var containsOnlyLetters: Bool {
    let notLetters = NSCharacterSet.letters.inverted
    return rangeOfCharacter(from: notLetters, options: String.CompareOptions.literal, range: nil) == nil
  }
  
  var isAlphanumeric: Bool {
    !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
  }
  
}

extension String {
  var condensedWhitespace: String {
    let components = self.components(separatedBy: .whitespacesAndNewlines)
    return components.filter { !$0.isEmpty }.joined(separator: " ")
  }
}
