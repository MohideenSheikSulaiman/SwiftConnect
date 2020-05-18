//
//  Todo.swift
//  Connect_Example
//
//  Created by Tarek Sabry on 5/18/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation

struct Todo: Codable {
    let id: Int
    let userId: Int
    let title: String
    let completed: Bool
}
