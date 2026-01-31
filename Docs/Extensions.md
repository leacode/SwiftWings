# Extensions Reference

SwiftWings ships a suite of lightweight `Foundation` extensions. This reference lists every extension module, the files that define it, and the key behaviors they provide. File paths refer to the `Sources/Extensions/Foundation` and `Tests/Extensions` directories so you can jump straight into the implementation or accompanying tests.

## Array
- **Source**: `Sources/Extensions/Foundation/Array`
- **Tests**: `Tests/Extensions/Array`
- **Highlights**:
  - `Array+Data.swift`: Exposes `Array<UInt8>.data` to bridge to `Data` in a single call.
  - `Array+Subscript.swift`: Adds the safe `subscript(guard:)` accessor plus `reduct(_:)`, a convenience reducer that operates only when the collection is non-empty.

## Bundle
- **Source**: `Sources/Extensions/Foundation/Bundle/Bundle+Extensions.swift`
- **Tests**: `Tests/Extensions/Bundle`
- **Highlights**: `appVersion` reads `CFBundleShortVersionString` directly from the bundle’s `infoDictionary`, matching the behavior exercised in `Bundle+ExtensionsTests`.

## Codable
- **Source**: `Sources/Extensions/Foundation/Codable/Codable+JSON.swift`
- **Tests**: `Tests/Extensions/Codable`
- **Highlights**:
  - `Encodable.jsonString` uses `JSONEncoder` + UTF-8 conversion for lightweight logging.
  - `Encodable.dictionary()` re-encodes the value and deserializes it into `[String: Any]` for quick dictionary views.

## Data & Mime Types
- **Source**: `Sources/Extensions/Foundation/Data`
- **Tests**: `Tests/Extensions/Data`
- **Highlights**:
  - `Data+Extensions.swift`: Adds `bytes` to expose `[UInt8]` for crypto and parsing helpers.
  - `Data+PrettyJSON.swift`: Provides `prettyJSONString`, conversion from JSON fragments to `Data`, plus array/dictionary convenience factories.
  - `Data+MimeType.swift` & `MimeType.swift`: Detect dozens of file signatures (audio/image/application/etc.) by inspecting magic numbers. Test fixtures in `Tests/Extensions/Data/Data+MimeTypeTests.swift` assert every signature.

## Date
- **Source**: `Sources/Extensions/Foundation/Date`
- **Tests**: `Tests/Extensions/Date`
- **Highlights**:
  - `Date+Extensions.swift`: Calendar helpers such as `currentTimeMillis`, `isToday`, `isInNextWeek`, previous/next weekday lookups, and rolling by days/months/years.
  - `Date+Components.swift`: Shorthand computed properties (`year`, `month`, `weekday`, etc.) that defer to `Calendar.current`.
  - `Date+Utilities.swift`: Adds start/end-of-component calculations, comparisons (`isSame`, `isBetween`), range helpers (`clamped`), arithmetic (`advanced`), and DST-safe interval/distance helpers.
  - `Date+TimeZone.swift`: User-facing helpers to convert a wall-clock time between zones, format using a pinned `DateFormatter`, and extract components for a supplied `TimeZone`.
  - `Date+Intervals.swift`: Convenience wrappers over `Calendar.dateInterval(of:for:)` and `dateComponents(_:from:to:)` so you can request DST-aware `DateInterval`s or structured differences with a single call.

## TimeZone
- **Source**: `Sources/Extensions/Foundation/TimeZone/TimeZone+Extensions.swift`
- **Tests**: `Tests/Extensions/Date/Date+TimeZoneTests.swift`
- **Highlights**: Adds `TimeZone.utc`, readable offset strings (e.g. `+05:30`), and DST helpers (`isDaylightSavingActive`, `upcomingDaylightSavingTransition`).

## Double
- **Source**: `Sources/Extensions/Foundation/Double`
- **Tests**: `Tests/Extensions/Double`
- **Highlights**:
  - `Double+Extensions.swift`: Adds `toString()` with `%.02f` formatting and `BinaryFloatingPoint.toInt()` for lossless conversions.
  - `Double+ChineseCurrency.swift`: Spells monetary amounts in formal Chinese numerals (`chineseMoneySpell`).

## Int
- **Source**: `Sources/Extensions/Foundation/Int`
- **Tests**: `Tests/Extensions/Int`
- **Highlights**:
  - `Int.bytes(_:)` exposes big-endian byte arrays. `half` safely divides values with guardrails against `-1...1`.
  - `BinaryInteger` traits for Simplified/Traditional Chinese spell-outs, parity checks, and conversions to `Double`/`String`.
  - `Int+ChineseCurrency.swift`: Bridges to `Double.chineseMoneySpell` for integer-friendly usage.

## Mirror
- **Source**: `Sources/Extensions/Foundation/Mirror/Mirror+Reflection.swift`
- **Tests**: `Tests/Extensions/Mirror`
- **Highlights**: `Mirror.reflectProperties` performs shallow or recursive reflection and invokes a closure for every child matching a type, mirroring the tests in `Mirror+ReflectionTests`.

## NSNumber
- **Source**: `Sources/Extensions/Foundation/NSNumber/NSNumber+Display.swift`
- **Tests**: `Tests/Extensions/NSNumber`
- **Highlights**: Placeholder file reserved for NSNumber display helpers. (Currently unused; documented so future additions have a canonical doc entry.)

## NSObject
- **Source**: `Sources/Extensions/Foundation/NSObject/NSObject+Name.swift`
- **Tests**: `Tests/Extensions/NSObject`
- **Highlights**: Adds `className` (type and instance) on non-macOS platforms because macOS already exposes these selectors. Tests assert portable behavior on all supported OSes.

## Optional
- **Source**: `Sources/Extensions/Foundation/Optional/Optional+Transform.swift`
- **Tests**: `Tests/Extensions/Optional`
- **Highlights**: Introduces the `???` operator, which mirrors `??` but always yields a `String` by describing the wrapped value or falling back to a lazily-evaluated default.

## Range
- **Source**: `Sources/Extensions/Foundation/Range/Range+Extensions.swift`
- **Tests**: `Tests/Extensions/Range`
- **Highlights**: Reserved for future range helpers. (No public APIs today.)

## Sequence
- **Source**: `Sources/Extensions/Foundation/Sequence/Sequence+Extensions.swift`
- **Tests**: `Tests/Extensions/Sequence`
- **Highlights**: Adds `Sequence.unique()` for hashable elements while preserving order via `Set` membership tracking.

## String
- **Source**: `Sources/Extensions/Foundation/String`
- **Tests**: `Tests/Extensions/String`
- **Highlights**:
  - `String+Extensions.swift`: JSON parsing helpers (`asDict`, `asArray`), `asURL`, localization, and JSON convenience initializers mirroring the data helpers.
  - `String+Emoji.swift`: Unicode scalar analysis for emoji detection plus `containsOnlyEmoji`, `trimmingEmojis`, etc.
  - `String+File.swift`: Extracts `fileExtension` from filenames.
  - `String+MD5.swift`: Pure-Swift MD5 implementation that powers the `.md5` computed property.
  - `String+Modify.swift`: Pluralization rules, vowel/consonant lists, dictionary-driven replacements, trimming utilities, and capitalization helpers.
  - `String+Subscript.swift`: Safe slicing APIs for every Swift range flavor (`ClosedRange`, `Range`, `PartialRangeFrom`, etc.).
  - `String+Validation.swift`: Validation suite for phone numbers, links, email, bank cards (Luhn), JSON, UUIDs, digits/letters, condensed whitespace, etc.

## Bundle & App Metadata
(Already covered under Bundle.)

If you add another extension folder, update this document and the associated tests so the catalogue stays accurate.
