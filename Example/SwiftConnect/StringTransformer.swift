//
//  StringTransformer.swift
//  Connect_Example
//
//  Created by Tarek Sabry on 5/18/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import SwiftConnect

extension Future where Value == Data {
    func asString() -> Future<String> {
        return transformed {
            return String(data: $0, encoding: .utf8) ?? ""
        }
    }
}
