import Foundation

public extension Date {

  /// Returns the beginning of the component that contains the current date.
  func start(of component: Calendar.Component, calendar: Calendar = .current) -> Date? {
    calendar.dateInterval(of: component, for: self)?.start
  }

  /// Returns the last representable moment inside the component that contains the current date.
  func end(of component: Calendar.Component, calendar: Calendar = .current) -> Date? {
    guard let interval = calendar.dateInterval(of: component, for: self) else { return nil }
    let reference = interval.end.timeIntervalSinceReferenceDate
    return Date(timeIntervalSinceReferenceDate: reference.nextDown)
  }

  /// Convenience helper that proxies `Calendar.isDate(_:equalTo:toGranularity:)` to the date instance.
  func isSame(_ component: Calendar.Component, as other: Date, calendar: Calendar = .current) -> Bool {
    calendar.isDate(self, equalTo: other, toGranularity: component)
  }

  /// Returns the signed distance between the date and another date for the provided component.
  func difference(to other: Date, component: Calendar.Component, calendar: Calendar = .current) -> Int {
    calendar.dateComponents([component], from: self, to: other).value(for: component) ?? 0
  }

  /// Checks whether the date falls between two bounds.
  func isBetween(_ start: Date, and end: Date, inclusive: Bool = true) -> Bool {
    let lower = min(start, end)
    let upper = max(start, end)

    if inclusive {
      return (lower...upper).contains(self)
    } else {
      return self > lower && self < upper
    }
  }

  /// Limits the date to a closed range, returning the closest bound if it falls outside.
  func clamped(to range: ClosedRange<Date>) -> Date {
    if self < range.lowerBound { return range.lowerBound }
    if self > range.upperBound { return range.upperBound }
    return self
  }

  /// Adds a delta for the provided component and returns the resulting date.
  func advanced(_ component: Calendar.Component, value: Int, calendar: Calendar = .current) -> Date? {
    calendar.date(byAdding: component, value: value, to: self)
  }
}
