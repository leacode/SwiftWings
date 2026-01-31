# Time-Zone Utilities

The `Date+TimeZone` helpers simplify converting and presenting dates for different audiences and locales.

## API Surface

- `converted(from:to:)` – Reinterprets the receiver as a wall-clock time in the source time zone and returns the corresponding wall-clock time in the destination zone. Handy when users schedule events in one zone but need to view them elsewhere.
- `formatted(_:timeZone:locale:)` – Produces a formatted string using a plain `DateFormatter` that is pinned to a specific time zone/locale.
- `components(_:timeZone:calendar:)` – Extracts date components (year/month/day/hour/etc.) as they would appear in the provided time zone.
- `TimeZone.utc` – Convenience accessor for a zero-offset zone, helpful for tests and server logic.
- `TimeZone.offsetString(for:)` – Builds human-readable offsets such as `+05:30` by leaning on `secondsFromGMT(for:)`.
- `TimeZone.isDaylightSavingActive(at:)` / `TimeZone.upcomingDaylightSavingTransition(after:)` – Small wrappers around Foundation’s DST APIs so you can expose “DST on/off” badges or show the next switchover time.

All functions are Foundation-only, so they work on iOS, macOS, tvOS, watchOS, and Linux.

## Usage Example

```swift
let utc = TimeZone(secondsFromGMT: 0)!
let la = TimeZone(identifier: "America/Los_Angeles")!
var calendar = Calendar(identifier: .gregorian)
calendar.timeZone = utc

let reference = DateComponents(calendar: calendar,
                               year: 2024,
                               month: 3,
                               day: 25,
                               hour: 12).date!

let losAngelesDate = reference.converted(from: utc, to: la)
losAngelesDate.formatted("yyyy-MM-dd HH:mm", timeZone: la, locale: Locale(identifier: "en_US_POSIX"))
// "2024-03-25 12:00"
```
