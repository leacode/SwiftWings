//
//  Sequence+Concurrency.swift
//  SwiftWings
//
//  Created by automation on 2026/1/31.
//
#if swift(>=5.5)
import Foundation

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public extension Sequence {
  /// Executes an async transform sequentially while preserving the original order.
  /// Inspired by approaches shared in open-source concurrency libraries like CollectionConcurrencyKit.
  func asyncMap<T>(
    _ transform: (Element) async throws -> T
  ) async rethrows -> [T] {
    var results: [T] = []
    results.reserveCapacity(underestimatedCount)
    for element in self {
      let value = try await transform(element)
      results.append(value)
    }
    return results
  }

  /// Executes an async transform concurrently using a task group while preserving the output order.
  func concurrentMap<T>(
    _ transform: @escaping @Sendable (Element) async throws -> T
  ) async rethrows -> [T] {
    let elements = Array(self)
    if elements.isEmpty { return [] }

    return try await withThrowingTaskGroup(of: (Int, T).self) { group in
      for (index, element) in elements.enumerated() {
        group.addTask {
          let value = try await transform(element)
          return (index, value)
        }
      }

      var buffer = Array(repeating: Optional<T>.none, count: elements.count)

      for try await (index, value) in group {
        buffer[index] = value
      }

      return buffer.compactMap { $0 }
    }
  }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public extension Sequence {
  /// Awaits completion of every element sequentially without allocating a results array.
  func asyncForEach(_ action: (Element) async throws -> Void) async rethrows {
    for element in self {
      try await action(element)
    }
  }

  /// Runs the provided closure for every element concurrently using a throwing task group.
  func concurrentForEach(
    _ action: @escaping @Sendable (Element) async throws -> Void
  ) async rethrows {
    let elements = Array(self)
    if elements.isEmpty { return }

    try await withThrowingTaskGroup(of: Void.self) { group in
      for element in elements {
        group.addTask {
          try await action(element)
        }
      }
      try await group.waitForAll()
    }
  }
}
#endif
