//
//  String+ValidationTests.swift
//  SwiftWingsTests
//
//  Created by leacode on 2020/1/6.
//  Copyright © 2020 Leacode. All rights reserved.
//

import XCTest
@testable import SwiftWings

class String_ValidationTests: XCTestCase {
  
  func test_containsPhoneNumber_returnsExpected() {
    XCTAssertTrue("13477292020".containsPhoneNumber)
    XCTAssertTrue("134-7729-2020".containsPhoneNumber)
    XCTAssertTrue("我的号码是13477292020".containsPhoneNumber)
    XCTAssertTrue("电话13477292020这个".containsPhoneNumber)
    XCTAssertTrue("我的号码是134-7729-2020".containsPhoneNumber)
    XCTAssertTrue("电话134-7729-2020这个".containsPhoneNumber)
    
    XCTAssertTrue("+8613477292020".containsPhoneNumber)
    XCTAssertTrue("+86134-7729-2020".containsPhoneNumber)
    XCTAssertTrue("我的号码是+86134-7729-2020".containsPhoneNumber)
    XCTAssertTrue("电话+86134-7729-2020这个".containsPhoneNumber)
    XCTAssertTrue("我的号码是+86134-7729-2020".containsPhoneNumber)
    XCTAssertTrue("电话+86134-7729-2020这个".containsPhoneNumber)
    
    XCTAssertTrue("+86 13477292020".containsPhoneNumber)
    XCTAssertTrue("+86 134-7729-2020".containsPhoneNumber)
    XCTAssertTrue("我的号码是+86 134-7729-2020".containsPhoneNumber)
    XCTAssertTrue("电话+86 134-7729-2020这个".containsPhoneNumber)
    XCTAssertTrue("我的号码是+86 134-7729-2020".containsPhoneNumber)
    XCTAssertTrue("电话+86 134-7729-2020这个".containsPhoneNumber)
    
    XCTAssertFalse("134772".containsPhoneNumber)
    XCTAssertFalse("134-772".containsPhoneNumber)
    XCTAssertFalse("电话+86 134-7这个".containsPhoneNumber)
    XCTAssertFalse("asdffds".containsPhoneNumber)
    XCTAssertFalse("".containsPhoneNumber)
  }
  
  func test_containsLink_returnsExpected() {
    XCTAssertTrue("http://www.google.com".containsLink)
    XCTAssertTrue("https://www.google.com".containsLink)
    XCTAssertFalse("wwwgooglecom".containsLink)
  }
  
  func test_containsAddress_returnsExpected() {
    XCTAssertFalse("fdafdsaf".containsAddress)
  }
  
  func test_strictContainsPhoneNumber_returnsExpected() {
    XCTAssertTrue("13477292020".strictContainsPhoneNumber)
    XCTAssertTrue("134-7729-2020".strictContainsPhoneNumber)
    XCTAssertTrue("我的号码是13477292020".strictContainsPhoneNumber)
    XCTAssertTrue("电话13477292020这个".strictContainsPhoneNumber)
    XCTAssertTrue("我的号码是134-7729-2020".strictContainsPhoneNumber)
    XCTAssertTrue("电话134-7729-2020这个".strictContainsPhoneNumber)
    
    XCTAssertTrue("+8613477292020".strictContainsPhoneNumber)
    XCTAssertTrue("+86134-7729-2020".strictContainsPhoneNumber)
    XCTAssertTrue("我的号码是+86134-7729-2020".strictContainsPhoneNumber)
    XCTAssertTrue("电话+86134-7729-2020这个".strictContainsPhoneNumber)
    XCTAssertTrue("我的号码是+86134-7729-2020".strictContainsPhoneNumber)
    XCTAssertTrue("电话+86134-7729-2020这个".strictContainsPhoneNumber)
    
    XCTAssertTrue("+86 13477292020".strictContainsPhoneNumber)
    XCTAssertTrue("+86 134-7729-2020".strictContainsPhoneNumber)
    XCTAssertTrue("我的号码是+86 134-7729-2020".strictContainsPhoneNumber)
    XCTAssertTrue("电话+86 134-7729-2020这个".strictContainsPhoneNumber)
    XCTAssertTrue("我的号码是+86 134-7729-2020".strictContainsPhoneNumber)
    XCTAssertTrue("电话+86 134-7729-2020这个".strictContainsPhoneNumber)
    
    XCTAssertTrue("电话1 3 4 7 7 2 9 2 0 1 2这个".strictContainsPhoneNumber)
    XCTAssertTrue("电话1-3-4-7-7-2-9-2-0-1-2这个".strictContainsPhoneNumber)
    XCTAssertTrue("电话13477~2~92020这个".strictContainsPhoneNumber)
    
    XCTAssertFalse("".strictContainsPhoneNumber)
    XCTAssertFalse("abc".strictContainsPhoneNumber)
  }
  
  func test_contains_returnsExpected() {
    XCTAssertFalse("123".contains(types: .date))
  }
  
  func test_isValidEmail_returnsExpected() {
    XCTAssertTrue("abc@gmail.com".isValidEmail)
    XCTAssertTrue("abc_faf989@gmail.com".isValidEmail)
    XCTAssertTrue("abc_faf989@gmail.com.abc.def".isValidEmail)
    
    XCTAssertFalse("abc_faf989@gmail".isValidEmail)
    XCTAssertFalse("@gmail.com.abc.def".isValidEmail)
    XCTAssertFalse("abc@".isValidEmail)
    XCTAssertFalse("abc@abc".isValidEmail)
    XCTAssertFalse("abc@abc.def  ".isValidEmail)
    XCTAssertFalse("   abc@abc.def".isValidEmail)
  }
  
  func test_isValidPhoneNumber_returnsExpected() {
    XCTAssertTrue("13563738943".isValidPhoneNumber)
    XCTAssertTrue("11211111111".isValidPhoneNumber)
    XCTAssertTrue("2345676".isValidPhoneNumber)
    XCTAssertTrue("1234543".isValidPhoneNumber)
    XCTAssertTrue("1199999".isValidPhoneNumber)
    
    XCTAssertFalse("119999".isValidPhoneNumber)
    XCTAssertFalse("11999".isValidPhoneNumber)
    XCTAssertFalse("1199".isValidPhoneNumber)
    XCTAssertFalse("119".isValidPhoneNumber)
    XCTAssertFalse("11".isValidPhoneNumber)
    XCTAssertFalse("1".isValidPhoneNumber)
    
    XCTAssertFalse("123".isValidPhoneNumber)
    XCTAssertFalse("123".isValidPhoneNumber)
    XCTAssertFalse("fasdfa".isValidPhoneNumber)
    XCTAssertFalse("|fa324".isValidPhoneNumber)
    XCTAssertFalse("1-2-3-4-5".isValidPhoneNumber)
    XCTAssertFalse(" ".isValidPhoneNumber)
    XCTAssertFalse("".isValidPhoneNumber)
  }
  
  func test_isInt_returnsExpected() {
    XCTAssertTrue("12345".isInt)
    XCTAssertTrue("-12345".isInt)
    
    XCTAssertFalse("".isInt)
    XCTAssertFalse("1 23 45".isInt)
    XCTAssertFalse("99999999999999999999999999".isInt)
    XCTAssertFalse("12345.43".isInt)
    XCTAssertFalse("212dsadsa".isInt)
  }
  
  func test_isDouble_returnsExpected() {
    
    XCTAssertTrue("12345.4567".isDouble)
    XCTAssertTrue("-12345.4567".isDouble)
    XCTAssertTrue("12345".isDouble)
    
    XCTAssertFalse("212dsadsa".isDouble)
  }
  
  func test_isFloat_returnsExpected() {
    XCTAssertTrue("12345.4567".isFloat)
    XCTAssertTrue("-12345.4567".isFloat)
    XCTAssertTrue("12345".isFloat)
    
    XCTAssertFalse("212dsadsa".isFloat)
  }
  
  func test_isUUID_returnsExpected() {
    XCTAssertTrue(UUID().uuidString.isUUID)
    XCTAssertFalse("faisdfjaosfa".isUUID)
  }
  
  func test_isValidJSON_returnsExpected() {
    XCTAssertTrue(#"{"name":"John"}"#.isValidJSON)
    
    XCTAssertFalse(#"{name:"John"}"#.isValidJSON)
  }
  
  func test_isValidChineseIDCardNo_returnsExpected() {
    
    XCTAssertTrue("511823198401103576".isValidChineseIDCardNo)
    XCTAssertTrue("450311197509084501".isValidChineseIDCardNo)
    XCTAssertTrue("511823198401106574".isValidChineseIDCardNo)
    XCTAssertTrue("450311197509082960".isValidChineseIDCardNo)
    XCTAssertTrue("450311197509082020".isValidChineseIDCardNo)
    XCTAssertTrue("450311197509084966".isValidChineseIDCardNo)
    XCTAssertTrue("450311197509088609".isValidChineseIDCardNo)
    XCTAssertTrue("511823198401101618".isValidChineseIDCardNo)
    XCTAssertTrue("45031119750908814X".isValidChineseIDCardNo)
    
    XCTAssertFalse("".isValidChineseIDCardNo)
    XCTAssertFalse("45031119759988814X".isValidChineseIDCardNo)
    XCTAssertFalse("511823198401101".isValidChineseIDCardNo)
    XCTAssertFalse("450311197509088149".isValidChineseIDCardNo)
    XCTAssertFalse("-12345.4567".isValidChineseIDCardNo)
    XCTAssertFalse("12345".isValidChineseIDCardNo)
    XCTAssertFalse("212dsadsa".isValidChineseIDCardNo)
    XCTAssertFalse("459311197509088609".isValidChineseIDCardNo)
  }
  
  func test_isValidBankCardNumber_returnsExpected() {
    XCTAssertTrue("6222 6002 6000 1072 444".isValidBankCardNumber)
    
    XCTAssertTrue("6217000630001006673".isValidBankCardNumber)
    XCTAssertTrue("6214832708150615".isValidBankCardNumber)
    XCTAssertTrue("4367424312010636088".isValidBankCardNumber)
    XCTAssertTrue("6214850276357743".isValidBankCardNumber)
    XCTAssertTrue("4367424312010636088".isValidBankCardNumber)
    XCTAssertTrue("6228482099360101273".isValidBankCardNumber)
    XCTAssertTrue("4563516507000581268".isValidBankCardNumber)
    XCTAssertTrue("6225885414675652".isValidBankCardNumber)
    XCTAssertTrue("6226220507881760".isValidBankCardNumber)
    XCTAssertTrue("4340622870856897".isValidBankCardNumber)
    XCTAssertTrue("6227002342155755777".isValidBankCardNumber)
    XCTAssertTrue("6212260200007845130".isValidBankCardNumber)
    XCTAssertTrue("9558821202005183097".isValidBankCardNumber)
    XCTAssertTrue("9558803400104364285".isValidBankCardNumber)
    
    XCTAssertFalse("".isValidBankCardNumber)
    XCTAssertFalse("asdf".isValidBankCardNumber)
    XCTAssertFalse("62226002600010724".isValidBankCardNumber)
    
    //testing
    //VISA
    XCTAssertTrue("4929939187355598".isValidBankCardNumber)
    XCTAssertTrue("4485383550284604".isValidBankCardNumber)
    XCTAssertTrue("4532307841419094".isValidBankCardNumber)
    XCTAssertTrue("4716014929481859".isValidBankCardNumber)
    XCTAssertTrue("4539677496449015".isValidBankCardNumber)
    XCTAssertFalse("4129939187355598".isValidBankCardNumber)
    XCTAssertFalse("4485383550184604".isValidBankCardNumber)
    XCTAssertFalse("4532307741419094".isValidBankCardNumber)
    XCTAssertFalse("4716014929401859".isValidBankCardNumber)
    XCTAssertFalse("4539672496449015".isValidBankCardNumber)
    //Master
    XCTAssertTrue("5454422955385717".isValidBankCardNumber)
    XCTAssertTrue("5582087594680466".isValidBankCardNumber)
    XCTAssertTrue("5485727655082288".isValidBankCardNumber)
    XCTAssertTrue("5523335560550243".isValidBankCardNumber)
    XCTAssertTrue("5128888281063960".isValidBankCardNumber)
    XCTAssertFalse("5454452295585717".isValidBankCardNumber)
    XCTAssertFalse("5582087594683466".isValidBankCardNumber)
    XCTAssertFalse("5487727655082288".isValidBankCardNumber)
    XCTAssertFalse("5523335500550243".isValidBankCardNumber)
    XCTAssertFalse("5128888221063960".isValidBankCardNumber)
    //Discover
    XCTAssertTrue("6011574229193527".isValidBankCardNumber)
    XCTAssertTrue("6011908281701522".isValidBankCardNumber)
    XCTAssertTrue("6011638416335074".isValidBankCardNumber)
    XCTAssertTrue("6011454315529985".isValidBankCardNumber)
    XCTAssertTrue("6011123583544386".isValidBankCardNumber)
    XCTAssertFalse("6011574229193127".isValidBankCardNumber)
    XCTAssertFalse("6031908281701522".isValidBankCardNumber)
    XCTAssertFalse("6011638416335054".isValidBankCardNumber)
    XCTAssertFalse("6011454316529985".isValidBankCardNumber)
    XCTAssertFalse("6011123581544386".isValidBankCardNumber)
    //American Express
    XCTAssertTrue("348570250878868".isValidBankCardNumber)
    XCTAssertTrue("341869994762900".isValidBankCardNumber)
    XCTAssertTrue("371040610543651".isValidBankCardNumber)
    XCTAssertTrue("341507151650399".isValidBankCardNumber)
    XCTAssertTrue("371673921387168".isValidBankCardNumber)
    XCTAssertFalse("348570250872868".isValidBankCardNumber)
    XCTAssertFalse("341669994762900".isValidBankCardNumber)
    XCTAssertFalse("371040610573651".isValidBankCardNumber)
    XCTAssertFalse("341557151650399".isValidBankCardNumber)
    XCTAssertFalse("371673901387168".isValidBankCardNumber)
  }
  
  func test_westernArabicNumeralsOnly_returnsExpected() {
    XCTAssertEqual("12jjsd32m2mk".westernArabicNumeralsOnly, "12322")
    XCTAssertEqual("asdfafaf".westernArabicNumeralsOnly, "")
  }
  
  func test_containsOnlyDigits_returnsExpected() {
    XCTAssertTrue("12312312".containsOnlyDigits)
    XCTAssertFalse("31231fds12".containsOnlyDigits)
    XCTAssertFalse("^&213213".containsOnlyDigits)
  }
  
  func test_containsOnlyLetters_returnsExpected() {
    XCTAssertTrue("afadsfafadf".containsOnlyLetters)
    XCTAssertTrue("afsAADFAvsffafaf".containsOnlyLetters)
    XCTAssertFalse("12kl23lkl32lkl".containsOnlyLetters)
    XCTAssertFalse("&*(iojoasf".containsOnlyLetters)
  }
  
  func test_isAlphanumeric_returnsExpected() {
    XCTAssertTrue("12312312".isAlphanumeric)
    XCTAssertTrue("31231fds12".isAlphanumeric)
    XCTAssertTrue("31231ADFADSFAfds12".isAlphanumeric)
    XCTAssertFalse("^&213213".isAlphanumeric)
  }
  
  func test_condensedWhitespace_returnsExpected() {
    XCTAssertEqual("Hello  World.\nHello!".condensedWhitespace, "Hello World. Hello!")
    XCTAssertEqual(" 3432 fadf afdf ".condensedWhitespace, "3432 fadf afdf")
  }
  
}

