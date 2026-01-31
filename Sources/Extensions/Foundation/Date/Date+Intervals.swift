import Foundation

public extension Date {

  /// Returns the calendar interval for a component, optionally forcing a specific time zone.
  func interval(of component: Calendar.Component,
                timeZone: TimeZone? = nil,
                calendar: Calendar = .current) -> DateInterval? {
    var calendar = calendar
    if let timeZone {
      calendar.timeZone = timeZone
    }
    return calendar.dateInterval(of: component, for: self)
  }

  /// Returns rich date components describing the distance between two dates.
  func distanceComponents(to other: Date,
                          components: Set<Calendar.Component> = [.year,
                                                                   .month,
                                                                   .day,
                                                                   .hour,
                                                                   .minute,
                                                                   .second],
                          timeZone: TimeZone? = nil,
                          calendar: Calendar = .current) -> DateComponents {
    var calendar = calendar
    if let timeZone {
      calendar.timeZone = timeZone
    }
    return calendar.dateComponents(components, from: self, to: other)
  }
}
