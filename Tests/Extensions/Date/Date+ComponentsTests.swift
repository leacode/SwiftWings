//
//  Date+ComponentsTests.swift
//  SwiftWingsTests
//
//  Created by Chunyu Li on 2021/6/18.
//  Copyright © 2021 Leacode. All rights reserved.
//

import XCTest
@testable import SwiftWings

class Date_ComponentsTests: XCTestCase {
  
  var formatter: DateFormatter!
  
  override func setUp() {
    super.setUp()
    
    formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    formatter.timeZone = TimeZone(identifier: "UTC +8")
  }
  
  override func tearDown() {
    formatter = nil
    super.tearDown()
  }
  
  // MARK: - Given
  
  func givenADate() -> Date {
    return formatter.date(from: "2021-06-18 11:12:13")!
  }
  
  func test_Data_era_returnsExpected() {
    let date = givenADate()
    let expectedResult = 1
    
    XCTAssertEqual(date.era, expectedResult)
  }
  
  func test_Data_year_returnsExpected() {
    let date = givenADate()
    let expectedResult = 2021
    
    XCTAssertEqual(date.year, expectedResult)
  }
  
  func test_Data_month_returnsExpected() {
    let date = givenADate()
    let expectedResult = 6
    
    XCTAssertEqual(date.month, expectedResult)
  }
  
  func test_Data_day_returnsExpected() {
    let date = givenADate()
    let expectedResult = 18
    
    XCTAssertEqual(date.day, expectedResult)
  }
  
  func test_Data_hour_returnsExpected() {
    let date = givenADate()
    let expectedResult = 11
    
    XCTAssertEqual(date.hour, expectedResult)
  }
  
  func test_Data_minute_returnsExpected() {
    let date = givenADate()
    let expectedResult = 12
    
    XCTAssertEqual(date.minute, expectedResult)
  }
  
  func test_Data_second_returnsExpected() {
    let date = givenADate()
    let expectedResult = 13
    
    XCTAssertEqual(date.second, expectedResult)
  }
  
  func test_Data_weekday_returnsExpected() {
    let date = givenADate() // It's a friday
    let expectedResult = 6
    
    XCTAssertEqual(date.weekday, expectedResult)
  }
  
  func test_Data_weekdayOrdinal_returnsExpected() {
    let date = givenADate()
    let expectedResult = 3 // Third friday of this May

    XCTAssertEqual(date.weekdayOrdinal, expectedResult)
  }

  func test_Data_weekOfMonth_returnsExpected() {
    let date = givenADate()
    let expectedResult = 3

    XCTAssertEqual(date.weekOfMonth, expectedResult)
  }
  
  func test_Data_weekOfYear_returnsExpected() {
    let date = givenADate()
    let expectedResult = 25

    XCTAssertEqual(date.weekOfYear, expectedResult)
  }
  
  func test_Data_yearForWeekOfYear_returnsExpected() {
    let date = givenADate()
    let expectedResult = 2021

    XCTAssertEqual(date.yearForWeekOfYear, expectedResult)
  }
  
  func test_Data_nanosecond_returnsExpected() {
    let date = givenADate()
    let expectedResult = 0

    XCTAssertEqual(date.nanosecond, expectedResult)
  }
  
  func test_Data_calender_returnsExpected() {
    let date = givenADate()
    let expectedResult = 9223372036854775807

    XCTAssertEqual(date.calendar, expectedResult)
  }
  
  func test_Data_timeZone_returnsExpected() {
    let date = givenADate()
    let expectedResult = 9223372036854775807

    XCTAssertEqual(date.timeZone, expectedResult)
  }
  
}
