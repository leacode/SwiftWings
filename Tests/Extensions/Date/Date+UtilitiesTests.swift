import XCTest
@testable import SwiftWings

final class Date_UtilitiesTests: XCTestCase {

  private var utcCalendar: Calendar!
  private var referenceDate: Date!
  private var startOfDay: Date!
  private var startOfMonth: Date!

  override func setUp() {
    super.setUp()
    var calendar = Calendar(identifier: .gregorian)
    calendar.timeZone = TimeZone(secondsFromGMT: 0)!
    utcCalendar = calendar

    referenceDate = DateComponents(calendar: utcCalendar,
                                   year: 2023,
                                   month: 4,
                                   day: 15,
                                   hour: 10,
                                   minute: 9,
                                   second: 8).date

    startOfDay = utcCalendar.startOfDay(for: referenceDate)
    startOfMonth = utcCalendar.date(from: DateComponents(calendar: utcCalendar, year: 2023, month: 4, day: 1))
  }

  override func tearDown() {
    utcCalendar = nil
    referenceDate = nil
    startOfDay = nil
    startOfMonth = nil
    super.tearDown()
  }

  func testStartOfComponentReturnsBeginningOfPeriod() {
    XCTAssertEqual(referenceDate.start(of: .day, calendar: utcCalendar), startOfDay)
    XCTAssertEqual(referenceDate.start(of: .month, calendar: utcCalendar), startOfMonth)
  }

  func testStartOfUnsupportedComponentReturnsNil() {
    XCTAssertNil(referenceDate.start(of: .calendar, calendar: utcCalendar))
  }

  func testEndOfComponentMatchesLastMomentInsidePeriod() {
    let expectedInterval = utcCalendar.dateInterval(of: .day, for: referenceDate)!
    let computedEnd = referenceDate.end(of: .day, calendar: utcCalendar)
    XCTAssertNotNil(computedEnd)
    XCTAssertLessThan(computedEnd!, expectedInterval.end)
    XCTAssertGreaterThanOrEqual(computedEnd!, expectedInterval.start)
  }

  func testEndOfUnsupportedComponentReturnsNil() {
    XCTAssertNil(referenceDate.end(of: .calendar, calendar: utcCalendar))
  }

  func testIsSameUsesCalendarGranularity() {
    let anotherDate = referenceDate.advanced(.day, value: 10, calendar: utcCalendar)!
    XCTAssertTrue(referenceDate.isSame(.month, as: anotherDate, calendar: utcCalendar))
    XCTAssertFalse(referenceDate.isSame(.day, as: anotherDate, calendar: utcCalendar))
  }

  func testDifferenceReturnsValueForComponent() {
    let nextHour = referenceDate.advanced(.hour, value: 5, calendar: utcCalendar)!
    XCTAssertEqual(referenceDate.difference(to: nextHour, component: .hour, calendar: utcCalendar), 5)
  }

  func testDifferenceReturnsZeroWhenComponentMissing() {
    let nextHour = referenceDate.advanced(.hour, value: 1, calendar: utcCalendar)!
    XCTAssertEqual(referenceDate.difference(to: nextHour, component: .calendar, calendar: utcCalendar), 0)
  }

  func testIsBetweenInclusiveAndExclusive() {
    let start = referenceDate.advanced(.day, value: -1, calendar: utcCalendar)!
    let end = referenceDate.advanced(.day, value: 1, calendar: utcCalendar)!

    XCTAssertTrue(referenceDate.isBetween(start, and: end))
    XCTAssertTrue(referenceDate.isBetween(end, and: start)) // verifies unordered bounds

    XCTAssertFalse(start.isBetween(start, and: end, inclusive: false))
    XCTAssertTrue(referenceDate.isBetween(start, and: end, inclusive: false))
  }

  func testClampedReturnsLowerUpperAndInRangeValues() {
    let range = startOfMonth...referenceDate
    let belowRange = startOfMonth.addingTimeInterval(-10)
    let aboveRange = referenceDate.addingTimeInterval(10)

    XCTAssertEqual(belowRange.clamped(to: range), range.lowerBound)
    XCTAssertEqual(aboveRange.clamped(to: range), range.upperBound)
    XCTAssertEqual(referenceDate.clamped(to: range), referenceDate)
  }

  func testAdvancedAddsDeltaToDate() {
    XCTAssertEqual(referenceDate.advanced(.day, value: 1, calendar: utcCalendar), referenceDate.addingTimeInterval(86400))
    XCTAssertEqual(referenceDate.advanced(.day, value: -1, calendar: utcCalendar), referenceDate.addingTimeInterval(-86400))
  }

  func testIntervalHandlesDaylightSavingTransitionsViaTimezone() {
    var calendar = Calendar(identifier: .gregorian)
    calendar.timeZone = TimeZone(identifier: "America/Los_Angeles")!
    let dstDate = DateComponents(calendar: calendar,
                                 year: 2023,
                                 month: 3,
                                 day: 12,
                                 hour: 10,
                                 minute: 0,
                                 second: 0).date!

    let interval = dstDate.interval(of: .day, timeZone: calendar.timeZone, calendar: calendar)

    XCTAssertNotNil(interval)
    XCTAssertEqual(interval?.duration, 23 * 60 * 60)
  }

  func testDistanceComponentsReturnsExpectedValues() {
    var calendar = Calendar(identifier: .gregorian)
    calendar.timeZone = TimeZone(identifier: "Asia/Tokyo")!
    let start = DateComponents(calendar: calendar,
                               year: 2023,
                               month: 3,
                               day: 25,
                               hour: 12,
                               minute: 0,
                               second: 0).date!
    let end = DateComponents(calendar: calendar,
                             year: 2023,
                             month: 3,
                             day: 27,
                             hour: 15,
                             minute: 30,
                             second: 0).date!

    let components = start.distanceComponents(to: end,
                                              components: [.day, .hour, .minute],
                                              timeZone: calendar.timeZone,
                                              calendar: calendar)

    XCTAssertEqual(components.day, 2)
    XCTAssertEqual(components.hour, 3)
    XCTAssertEqual(components.minute, 30)
  }
}
