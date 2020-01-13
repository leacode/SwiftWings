# SwiftWings
A collection of Swift extensions for all platforms.
leacode/SwiftWings

[![Version](https://img.shields.io/cocoapods/v/SwiftWings.svg?style=flat)](https://cocoapods.org/pods/SwiftWings)
[![License](https://img.shields.io/cocoapods/l/SwiftWings.svg?style=flat)](https://cocoapods.org/pods/SwiftWings)
[![Platform](https://img.shields.io/cocoapods/p/SwiftWings.svg?style=flat)](https://cocoapods.org/pods/SwiftWings)
[![Codecov](https://codecov.io/gh/leacode/SwiftWings/branch/master/graph/badge.svg)](https://codecov.io/gh/leacode/SwiftWings)

## Requirements

- iOS 8.0+ / macOS 10.10+ 
- Swift 5.0+
- Linux can run Swift

## Installation

### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

Earth is available through [CocoaPods](https://cocoapods.org). To install
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

To integrate Earth into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "leacode/SwiftWings"
```

Run `carthage update` to build the framework and drag the built `SwiftWings.framework` into your Xcode project.

### Swift Package Manager

#### For iOS/ MacOS:

1. Star this repo.
2. Login your github account in Xcode.
3. Go to Swift Packages tab in your project settings, click add button and search SwiftWings, add it to your project.
4. Add Earth.framework after SPM finished downloading the source code.

#### For Server Side:


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

Earth is available under the MIT license. See the LICENSE file for more info.

