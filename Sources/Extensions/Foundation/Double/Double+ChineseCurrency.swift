//
//  Double+ChineseMoney.swift
//  SwiftWings
//
//  Created by leacode on 2020/3/30.
//  Copyright © 2020 Leacode. All rights reserved.
//

import Foundation

public extension Double {
  var chineseMoneySpell: String? {
    
    let decimalFormatter = NumberFormatter()
    decimalFormatter.maximumFractionDigits = 2
    decimalFormatter.minimumFractionDigits = 2
    let money = decimalFormatter.string(from: NSNumber(value: self))!
    
    let value: NSNumber = NSNumber(value: Double(money)!)
    let userLocale = Locale(identifier: "zh_Hans_CN")
    let formatter = NumberFormatter()
    formatter.numberStyle = .spellOut
    formatter.locale = userLocale
    
    let chinese = formatter.string(from: value)!.replacingOccurrences(of: "〇", with: "零")
    
    var chineseMoney = chinese
    
    let chineseMoneyDictionary = ["一": "壹",
                                  "二": "贰",
                                  "三": "叁",
                                  "四": "肆",
                                  "五": "伍",
                                  "六": "陆",
                                  "七": "柒",
                                  "八": "捌",
                                  "九": "玖",
                                  "十": "拾",
                                  "百": "佰",
                                  "千": "仟",
                                  "万": "万",
                                  "亿": "亿",
                                  "兆": "兆",
                                  "京": "京"]
    chineseMoney = chineseMoney.replacingCharacters(in: chineseMoneyDictionary)
    
    if chineseMoney.contains("点") {
      chineseMoney = chineseMoney.replacingOccurrences(of: "点", with: "圆")
      if chineseMoney.contains("零圆") {
        chineseMoney = chineseMoney.replacingOccurrences(of: "零圆", with: "")
        if chineseMoney.count > 0 {
          chineseMoney.insert("角", at: chineseMoney.index(chineseMoney.startIndex, offsetBy: 1))
        }
        if chineseMoney.count == 3 {
          chineseMoney += "分"
        }
      } else if chineseMoney.contains("零") {
        chineseMoney += "分"
      } else {
        let stringAfterDot = chinese.split(separator: "点").last!
        if stringAfterDot.count == 1 {
          chineseMoney += "角"
        } else {
          chineseMoney.insert("角", at: chinese.index(before: chinese.endIndex))
          chineseMoney += "分"
        }
      }
    } else {
      chineseMoney += "圆整"
    }
    
    if chineseMoney.prefix(1) == "拾" {
      chineseMoney.insert("壹", at: chineseMoney.startIndex)
    }
    
    return chineseMoney
  }
  
}
