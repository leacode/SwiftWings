import Foundation

public extension Date {

  /// Reinterprets the date as a wall-clock time in `sourceTimeZone`
  /// and returns a date representing the same clock time in `destinationTimeZone`.
  func converted(from sourceTimeZone: TimeZone, to destinationTimeZone: TimeZone) -> Date {
    let sourceOffset = sourceTimeZone.secondsFromGMT(for: self)
    let destinationOffset = destinationTimeZone.secondsFromGMT(for: self)
    return addingTimeInterval(TimeInterval(sourceOffset - destinationOffset))
  }

  /// Formats the date with a custom format inside a specific time zone.
  func formatted(_ format: String,
                 timeZone: TimeZone,
                 locale: Locale = .current) -> String {
    let formatter = DateFormatter()
    formatter.timeZone = timeZone
    formatter.locale = locale
    formatter.dateFormat = format
    return formatter.string(from: self)
  }

  /// Returns date components evaluated in the provided time zone.
  func components(_ components: Set<Calendar.Component> = [.year,
                                                           .month,
                                                           .day,
                                                           .hour,
                                                           .minute,
                                                           .second],
                  timeZone: TimeZone,
                  calendar: Calendar = .current) -> DateComponents {
    var calendar = calendar
    calendar.timeZone = timeZone
    return calendar.dateComponents(components, from: self)
  }
}
