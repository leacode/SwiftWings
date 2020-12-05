// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(name: "SwiftWings",
                      platforms: [.macOS(.v10_11),
                                  .iOS(.v12),
                                  .tvOS(.v9),
                                  .watchOS(.v2)],
                      products: [.library(name: "SwiftWings",
                                          targets: ["SwiftWings"])],
                      targets: [.target(name: "SwiftWings",
                                        path: "Sources")],
                      swiftLanguageVersions: [.v5])
