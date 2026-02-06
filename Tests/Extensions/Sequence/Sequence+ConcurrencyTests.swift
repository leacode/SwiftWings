import XCTest
import Foundation
@testable import SwiftWings

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
final class Sequence_ConcurrencyTests: XCTestCase {
  func testAsyncMapPreservesOrder() async throws {
    let numbers = [1, 2, 3]
    let values = try await numbers.asyncMap { value -> Int in
      try await Task.sleep(nanoseconds: 1_000_000)
      return value * 2
    }

    XCTAssertEqual(values, [2, 4, 6])
  }

  func testConcurrentMapPreservesOrder() async throws {
    let numbers = [1, 2, 3, 4]
    let values = try await numbers.concurrentMap { value -> Int in
      try await Task.sleep(nanoseconds: UInt64.random(in: 100_000...300_000))
      return value * value
    }

    XCTAssertEqual(values, [1, 4, 9, 16])
  }

  func testConcurrentForEachExecutesAllElements() async throws {
    let numbers = Array(0..<8)
    var visited = Array(repeating: false, count: numbers.count)
    let lock = NSLock()

    try await numbers.concurrentForEach { value in
      lock.lock()
      visited[value] = true
      lock.unlock()
    }

    XCTAssertTrue(visited.allSatisfy { $0 })
  }
}
