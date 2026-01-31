import Foundation

public extension TimeZone {

  /// Common UTC convenience accessor.
  static var utc: TimeZone { TimeZone(secondsFromGMT: 0)! }

  /// Returns a human-readable UTC offset such as +05:30 for the provided date.
  func offsetString(for date: Date = Date()) -> String {
    let seconds = secondsFromGMT(for: date)
    let hours = seconds / 3600
    let minutes = abs(seconds / 60) % 60
    return String(format: "%+03d:%02d", hours, minutes)
  }

  /// Indicates whether daylight saving rules are currently active for the provided date.
  func isDaylightSavingActive(at date: Date = Date()) -> Bool {
    isDaylightSavingTime(for: date)
  }

  /// Convenience wrapper around `nextDaylightSavingTimeTransition(after:)`.
  func upcomingDaylightSavingTransition(after date: Date = Date()) -> Date? {
    nextDaylightSavingTimeTransition(after: date)
  }
}
