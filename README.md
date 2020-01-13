# SwiftWings

[![Version](https://img.shields.io/cocoapods/v/SwiftWings.svg?style=flat)](https://cocoapods.org/pods/SwiftWings)
[![License](https://img.shields.io/cocoapods/l/SwiftWings.svg?style=flat)](https://github.com/leacode/SwiftWings/blob/master/LICENSE)
[![Platform](https://img.shields.io/cocoapods/p/SwiftWings.svg?style=flat)](https://cocoapods.org/pods/SwiftWings)
[![Codecov](https://codecov.io/gh/leacode/SwiftWings/branch/master/graph/badge.svg)](https://codecov.io/gh/leacode/SwiftWings)

`SwiftWings` is A collection of Swift extensions. It support iOS, macOS, tvOS, watchOS. You can also integrate the framework in your server side project by using Swift Package Manager.

## Requirements

- iOS 8.0+ / macOS 10.10+ 
- Swift 5.0+
- Watch OS 2.0+
- TV OS 9.0+
- Linux can run Swift

## Installation

### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

SwiftWings is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
use_frameworks!

target '<Your Target Name>' do
pod 'SwiftWings'
end
```

Then, run the following command:

```bash
$ pod install
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](https://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate SwiftWings into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "leacode/SwiftWings"
```

Run `carthage update` to build the framework and drag the built `SwiftWings.framework` into your Xcode project.

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

#### iOS/ MacOS:

To integrate `SwiftWings` into your Xcode project using Xcode 11, specify it in `File > Swift Packages > Add`:

```
https://github.com/leacode/SwiftWings
```


#### Server Side:

Add dependency in Package.swift:

```
dependencies: [
    .package(url: "https://github.com/leacode/SwiftWings.git", from: "1.0.0"),
]

...

.target(name: "App", dependencies: ["SwiftWings", ...]),

...

```

## Author

**Chunyu Li**

- [Linked in](http://www.linkedin.com/in/春毓-李-96920b92/)
- [简书](https://www.jianshu.com/u/1c5cb3408b0f)
- [Twitter](https://twitter.com/leacode) / [Facebook](https://www.facebook.com/leacode.lea)

## License

`SwiftWings` is available under the MIT license. See the `LICENSE` file for more info.

