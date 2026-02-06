//
//  URL+Query.swift
//  SwiftWings
//
//  Created by automation on 2026/1/31.
//

import Foundation

public extension URL {
  /// Returns a dictionary containing the last value found for every query key.
  /// Duplicate keys are coalesced by keeping the most recent value in the URL.
  var queryParameters: [String: String] {
    guard let items = URLComponents(url: self, resolvingAgainstBaseURL: true)?.queryItems else {
      return [:]
    }

    return items.reduce(into: [String: String]()) { partialResult, item in
      partialResult[item.name] = item.value ?? ""
    }
  }

  /// Returns a new URL by merging query parameters into the current URL.
  ///
  /// - Parameters:
  ///   - parameters: New key/value pairs. Pass `nil` for a value to remove the key.
  ///   - replaceExisting: When `true`, the method overrides existing keys. When `false`,
  ///   the method only appends keys that were missing.
  /// - Returns: A URL with the merged query string or `nil` when the URL cannot be represented.
  func mergingQueryParameters(
    _ parameters: [String: String?],
    replaceExisting: Bool = true
  ) -> URL? {
    guard !parameters.isEmpty else { return self }
    guard var components = URLComponents(url: self, resolvingAgainstBaseURL: true) else { return nil }

    var orderedKeys: [String] = []
    var seenKeys = Set<String>()
    var merged = [String: String]()

    if let existingItems = components.queryItems {
      for item in existingItems where seenKeys.insert(item.name).inserted {
        orderedKeys.append(item.name)
        merged[item.name] = item.value ?? ""
      }
    }

    for (key, value) in parameters {
      switch value {
      case .some(let newValue):
        guard replaceExisting || merged[key] == nil else { continue }
        if seenKeys.insert(key).inserted {
          orderedKeys.append(key)
        }
        merged[key] = newValue
      case .none:
        merged.removeValue(forKey: key)
        seenKeys.remove(key)
        orderedKeys.removeAll { $0 == key }
      }
    }

    if merged.isEmpty {
      components.queryItems = nil
      return components.url
    }

    components.queryItems = orderedKeys.compactMap { key in
      guard let value = merged[key] else { return nil }
      return URLQueryItem(name: key, value: value)
    }

    return components.url
  }

  /// Removes the provided query keys from the URL if they exist.
  /// - Parameter names: The keys to drop from the query string.
  /// - Returns: A URL with the specified keys removed or `nil` when the URL cannot be represented.
  func removingQueryParameters<S: Sequence>(_ names: S) -> URL? where S.Element == String {
    let removalMap = Dictionary(uniqueKeysWithValues: names.map { key in (key, Optional<String>.none) })
    return removalMap.isEmpty ? self : mergingQueryParameters(removalMap)
  }
}
