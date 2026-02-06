import XCTest
@testable import SwiftWings

final class URL_QueryTests: XCTestCase {
  func testQueryParametersCoalescesDuplicates() throws {
    let url = try XCTUnwrap(URL(string: "https://example.com?first=1&dup=old&last=3&dup=new&blank"))
    let parameters = url.queryParameters
    XCTAssertEqual(parameters["first"], "1")
    XCTAssertEqual(parameters["dup"], "new")
    XCTAssertEqual(parameters["blank"], "")
    XCTAssertEqual(parameters["missing"], nil)
  }

  func testMergingQueryParametersReplacingValues() throws {
    let base = try XCTUnwrap(URL(string: "https://example.com/search?q=swift&lang=en"))
    let merged = try XCTUnwrap(base.mergingQueryParameters([
      "q": "swift concurrency",
      "page": "1",
      "lang": nil
    ]))

    XCTAssertEqual(
      merged.absoluteString,
      "https://example.com/search?q=swift%20concurrency&page=1"
    )
  }

  func testMergingQueryParametersSkippingExistingWhenRequested() throws {
    let base = try XCTUnwrap(URL(string: "https://example.com/search?q=swift"))
    let merged = try XCTUnwrap(base.mergingQueryParameters([
      "q": "swift concurrency",
      "page": "1"
    ], replaceExisting: false))

    XCTAssertEqual(merged.absoluteString, "https://example.com/search?q=swift&page=1")
  }

  func testRemovingQueryParameters() throws {
    let base = try XCTUnwrap(URL(string: "https://example.com/search?q=swift&page=2&lang=en"))
    let cleaned = try XCTUnwrap(base.removingQueryParameters(["page", "missing"]))

    XCTAssertEqual(cleaned.absoluteString, "https://example.com/search?q=swift&lang=en")
  }
}
