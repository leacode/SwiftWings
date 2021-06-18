//
//  Date+ExtensionsTests.swift
//  SwiftWingsTests
//
//  Created by leacode on 2020/1/14.
//  Copyright © 2020 Leacode. All rights reserved.
//

import XCTest
@testable import SwiftWings

class Date_ExtensionsTests: XCTestCase {
  
  var now: Date!
  var dayFormatter: DateFormatter!
  var formatter: DateFormatter!
  
  override func setUp() {
    super.setUp()
    
    now = Date()
    formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    
    dayFormatter = DateFormatter()
    dayFormatter.dateFormat = "yyyy-MM-dd"
  }
  
  override func tearDown() {
    now = nil
    formatter = nil
    dayFormatter = nil
    super.tearDown()
  }
  
  // MARK: - given
  func givenAMonday() -> Date {
    return dayFormatter.date(from: "2020-01-13")!
  }
  
  // MARK: - Tests
  
  func test_Date_currentTimeMillis_returnsExpected() {
    let timeMillis = now.timeIntervalSince1970 * 1000
    XCTAssertGreaterThanOrEqual(Date.currentTimeMillis, Int64(timeMillis))
  }
  
  func test_Date_timeMillis_returnsExpected() {
    let timeMillis = now.timeIntervalSince1970 * 1000
    XCTAssertGreaterThanOrEqual(Date().timeMillis, Int64(timeMillis))
  }

  func test_Date_isToday_returnsExpected() {
    XCTAssertTrue(now.isToday)
  }
  
  func test_Date_isTomorrow_returnsExpected() {
    let tomorrow = now.addingTimeInterval(60 * 60 * 24)
    
    XCTAssertTrue(tomorrow.isTomorrow)
    XCTAssertFalse(now.isTomorrow)
  }
  
  func test_Date_isInThisWeek_returnsExpected() {
    
    XCTAssertTrue(now.isInThisWeek)
  }
  
  func test_Date_isInNextWeek_returnsExpected() {
    let date = now.addingTimeInterval(60 * 60 * 24 * 7)
    
    XCTAssertTrue(date.isInNextWeek)
  }
  
  func test_Date_lastMonday_returnsExpected() {
    let aMonday = givenAMonday()
    guard let expectedDate = dayFormatter.date(from: "2020-01-06") else { return }
    let aLastMonday = aMonday.lastMonday
    
    XCTAssertEqual(aLastMonday, expectedDate)
  }
  
  func test_Date_lastTuesday_returnsExpected() {
    let aMonday = givenAMonday()
    guard let expectedDate = dayFormatter.date(from: "2020-01-07") else { return }
    let aLastTuesday = aMonday.lastTuesday
    
    XCTAssertEqual(aLastTuesday, expectedDate)
  }
  
  func test_Date_lastWednesday_returnsExpected() {
    let aMonday = givenAMonday()
    guard let expectedDate = dayFormatter.date(from: "2020-01-08") else { return }
    let aLastWednesday = aMonday.lastWednesday
    
    XCTAssertEqual(aLastWednesday, expectedDate)
  }
  
  func test_Date_lastThursday_returnsExpected() {
    let aMonday = givenAMonday()
    guard let expectedDate = dayFormatter.date(from: "2020-01-09") else { return }
    let aLastThursday = aMonday.lastThursday
    
    XCTAssertEqual(aLastThursday, expectedDate)
  }
  
  func test_Date_lastFriday_returnsExpected() {
    let aMonday = givenAMonday()
    guard let expectedDate = dayFormatter.date(from: "2020-01-10") else { return }
    let aLastFriday = aMonday.lastFriday
    
    XCTAssertEqual(aLastFriday, expectedDate)
  }
  
  func test_Date_lastSatuaday_returnsExpected() {
    let aMonday = givenAMonday()
    guard let expectedDate = dayFormatter.date(from: "2020-01-11") else { return }
    let aLastSatuaday = aMonday.lastSatuaday
    
    XCTAssertEqual(aLastSatuaday, expectedDate)
  }
  
  func test_Date_lastSunday_returnsExpected() {
    let aMonday = givenAMonday()
    guard let expectedDate = dayFormatter.date(from: "2020-01-12") else { return }
    let aLastSunday = aMonday.lastSunday
    
    XCTAssertEqual(aLastSunday, expectedDate)
  }
  
  func test_Date_lastDay_returnsExpected() {
    let aMonday = givenAMonday()
    guard let expectedDate = dayFormatter.date(from: "2020-01-12") else { return }
    XCTAssertEqual(aMonday.lastDay!, expectedDate)
  }
  
  func test_Date_nextDay_returnsExpected() {
    let aMonday = givenAMonday()
    guard let expectedDate = dayFormatter.date(from: "2020-01-14") else { return }
    XCTAssertEqual(aMonday.nextDay!, expectedDate)
  }
  
  func test_Date_lastMonth_returnsExpected() {
    let date = dayFormatter.date(from: "2020-5-31")!
    guard let expectedDate = dayFormatter.date(from: "2020-04-30") else { return }
    XCTAssertEqual(date.lastMonth!, expectedDate)
  }
  
  func test_Date_nextMonth_returnsExpected() {
    let date = dayFormatter.date(from: "2020-5-31")!
    guard let expectedDate = dayFormatter.date(from: "2020-06-30") else { return }
    XCTAssertEqual(date.nextMonth!, expectedDate)
  }
  
  func test_Date_lastYear_returnsExpected() {
    let date = dayFormatter.date(from: "2020-5-31")!
    guard let expectedDate = dayFormatter.date(from: "2019-065-31") else { return }
    let lastYear = date.lastYear!
    
    XCTAssertEqual(lastYear, expectedDate)
  }
  
  func test_Date_nextYear_returnsExpected() {
    let date = dayFormatter.date(from: "2020-5-31")!
    guard let expectedDate = dayFormatter.date(from: "2021-065-31") else { return }
    let nextYear = date.nextYear!
    
    XCTAssertEqual(nextYear, expectedDate)
  }

}
