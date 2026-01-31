import XCTest
@testable import SwiftWings

final class Date_TimeZoneTests: XCTestCase {

  private var utc: TimeZone!
  private var losAngeles: TimeZone!
  private var tokyo: TimeZone!
  private var calendar: Calendar!
  private var referenceDate: Date!
  private var posixLocale: Locale!

  override func setUp() {
    super.setUp()
    utc = TimeZone(secondsFromGMT: 0)!
    losAngeles = TimeZone(identifier: "America/Los_Angeles")!
    tokyo = TimeZone(identifier: "Asia/Tokyo")!
    posixLocale = Locale(identifier: "en_US_POSIX")

    calendar = Calendar(identifier: .gregorian)
    calendar.timeZone = utc

    referenceDate = DateComponents(calendar: calendar,
                                   year: 2023,
                                   month: 3,
                                   day: 25,
                                   hour: 12,
                                   minute: 0,
                                   second: 0).date!
  }

  override func tearDown() {
    utc = nil
    losAngeles = nil
    tokyo = nil
    calendar = nil
    referenceDate = nil
    posixLocale = nil
    super.tearDown()
  }

  func testConvertedKeepsClockComponentsAcrossTimeZones() {
    let converted = referenceDate.converted(from: utc, to: losAngeles)

    XCTAssertEqual(converted.converted(from: losAngeles, to: utc), referenceDate)

    let losAngelesString = converted.formatted("yyyy-MM-dd HH:mm", timeZone: losAngeles, locale: posixLocale)
    XCTAssertEqual(losAngelesString, "2023-03-25 12:00")
  }

  func testFormattedProducesStringInRequestedTimeZone() {
    let formatted = referenceDate.formatted("HH:mm", timeZone: tokyo, locale: posixLocale)
    XCTAssertEqual(formatted, "21:00") // UTC+9
  }

  func testComponentsReflectProvidedTimeZone() {
    let components = referenceDate.components(timeZone: tokyo, calendar: calendar)
    XCTAssertEqual(components.year, 2023)
    XCTAssertEqual(components.month, 3)
    XCTAssertEqual(components.day, 25)
    XCTAssertEqual(components.hour, 21)
    XCTAssertEqual(components.minute, 0)
    XCTAssertEqual(components.second, 0)
  }

  func testTimeZoneOffsetStringProducesExpectedFormat() {
    let india = TimeZone(secondsFromGMT: 19800)!
    XCTAssertEqual(india.offsetString(for: referenceDate), "+05:30")
  }

  func testDaylightSavingHelpersReflectTimeZoneBehavior() {
    let summer = DateComponents(calendar: calendar,
                                year: 2023,
                                month: 7,
                                day: 1,
                                hour: 12).date!
    let winter = DateComponents(calendar: calendar,
                                year: 2023,
                                month: 1,
                                day: 15,
                                hour: 12).date!

    XCTAssertTrue(losAngeles.isDaylightSavingActive(at: summer))
    XCTAssertFalse(losAngeles.isDaylightSavingActive(at: winter))
    XCTAssertNotNil(losAngeles.upcomingDaylightSavingTransition(after: winter))

    XCTAssertFalse(TimeZone.utc.isDaylightSavingActive(at: referenceDate))
    XCTAssertNil(TimeZone.utc.upcomingDaylightSavingTransition(after: referenceDate))
  }
}
