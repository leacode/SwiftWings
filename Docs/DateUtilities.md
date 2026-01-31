# Date Utilities

This document summarizes the cross-platform helpers that ship with `Date+Utilities.swift`.

## API Surface

- `start(of:calendar:)` – Returns the beginning of the component (day, month, week, etc.) that contains the receiver.
- `end(of:calendar:)` – Returns the last representable moment inside the component that contains the receiver.
- `isSame(_:as:calendar:)` – Convenience helper that forwards to `Calendar.isDate(_:equalTo:toGranularity:)`.
- `difference(to:component:calendar:)` – Signed difference between two dates for the supplied calendar component.
- `isBetween(_:and:inclusive:)` – Checks whether the date falls between two dates; bounds can be provided in any order.
- `clamped(to:)` – Constrains the date to a `ClosedRange<Date>`.
- `advanced(_:value:calendar:)` – Adds/subtracts a value for a component using the provided calendar.
- `interval(of:timeZone:calendar:)` – A thin wrapper over `Calendar.dateInterval(of:for:)` that lets you inject a time zone for correct DST-aware ranges.
- `distanceComponents(to:components:timeZone:calendar:)` – Returns rich `DateComponents` describing the distance between two dates, perfect for “x days, y hours” readouts.

Every method defaults to `Calendar.current` while remaining fully customizable so that you can inject deterministic calendars/time zones (which is especially useful in tests or server code).

## Usage Examples

```swift
let calendar = Calendar(identifier: .gregorian)
let now = Date()

let beginningOfDay = now.start(of: .day, calendar: calendar)
let nextWeek = now.advanced(.weekOfYear, value: 1, calendar: calendar)

if let nextWeek, now.isBetween(now, and: nextWeek, inclusive: false) {
  // ...
}
```

All APIs are available on Apple platforms and Linux because they only depend on the standard `Foundation` module.
