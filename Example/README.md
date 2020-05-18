# SwiftConnect

[![Version](https://img.shields.io/cocoapods/v/SwiftConnect.svg?style=flat)](https://cocoapods.org/pods/SwiftConnect)
[![License](https://img.shields.io/cocoapods/l/SwiftConnect.svg?style=flat)](https://cocoapods.org/pods/SwiftConnect)
[![Platform](https://img.shields.io/cocoapods/p/SwiftConnect.svg?style=flat)](https://cocoapods.org/pods/SwiftConnect)

## What is SwiftConnect?

SwiftConnect is a lightweight network abstraction layer, built on top of Alamofire. It can be used to dramatically simplify interacting with RESTful JSON web-services.

## Table of contents

- [Why should I use SwiftConnect and not any other abstraction layer?](https://github.com/tareksabry1337/Connect/blob/master/Why%20use%20SwiftConnect.md)
- [Transformers](https://github.com/tareksabry1337/Connect/blob/master/Transformers.md)
    - [Codable Transformer](https://github.com/tareksabry1337/Connect/blob/master/Transformers.md#Codable-Transformer)
    - [Dictionary Transformer](https://github.com/tareksabry1337/Connect/blob/master/Transformers.md#Dictionary-Transformer)
    - [Void Transformer](https://github.com/tareksabry1337/Connect/blob/master/Transformers.md#Void-Transformer)
    - [Creating your own transformer](https://github.com/tareksabry1337/Connect/blob/master/Transformers.md#Creating-your-own-transformer)
- [Usage](https://github.com/tareksabry1337/Connect/blob/master/Usage.md)
    - [How to use connect?](https://github.com/tareksabry1337/Connect/blob/master/Usage.md#How-to-use-Connect)
    - [Connect](https://github.com/tareksabry1337/Connect/blob/master/Usage.md#Connect)
    - [Connect Middleware](https://github.com/tareksabry1337/Connect/blob/master/Usage.md#ConnectMiddleware)
    - [Error Handler](https://github.com/tareksabry1337/Connect/blob/master/Usage.md#ErrorHandler)
    - [Connector](https://github.com/tareksabry1337/Connect/blob/master/Usage.md#Connector)
    - [What is Parameter?](https://github.com/tareksabry1337/Connect/blob/master/Usage.md#What-is-Parameter)
    - [What is CompositeParameters?](https://github.com/tareksabry1337/Connect/blob/master/Usage.md#What-is-CompositeParameters)
    - [AuthorizedConnector](https://github.com/tareksabry1337/Connect/blob/master/Usage.md#AuthorizedConnector)
    - [File](https://github.com/tareksabry1337/Connect/blob/master/Usage.md#File)
    - [Using Connect](https://github.com/tareksabry1337/Connect/blob/master/Usage.md#Using-Connect)
- [Debugging](https://github.com/tareksabry1337/Connect/blob/master/Debugging.md)

## Requirements

- iOS 10.0+
- Xcode 11+
- Swift 5.0+

## Installation

Connect is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SwiftConnect'
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Support

Please, don't hesitate to [file an
issue](https://github.com/tareksabry1337/Connect/issues/new) if you have questions.

## What's Next ?
- [ ] Unit Testing
- [ ] OAuth2 Support out of the box
- [ ] Support for downloading tasks
- [ ] Support for handling refresh tokens.
- [ ] Carthage Support
- [ ] SwiftPM Support
- [ ] PropertyWrappers version (Inspired by Retrofit)

## Dependncies
Connect depends mainly on two things

The awesome Future/Promises built by  [John Sundell][Future/Promises]<br>
Alamofire [Alamofire][Alamofire]

[Future/Promises]: https://github.com/JohnSundell/SwiftBySundell/blob/master/Blog/Under-the-hood-of-Futures-and-Promises.swift
[Alamofire]: https://github.com/Alamofire/Alamofire

Everything else was built from scratch natively and using Swift's Modern APIs

## License

Connect is available under the MIT license. See the LICENSE file for more info.
