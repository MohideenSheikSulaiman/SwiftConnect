//
//  TodoConnector.swift
//  Connect_Example
//
//  Created by Tarek Sabry on 5/18/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import SwiftConnect

enum TodoConnector: Connector {
    
    case get(id: Int)
    
    var baseURL: URL {
        return URL(string: "https://jsonplaceholder.typicode.com")!
    }
    
    var endpoint: String {
        switch self {
        case .get:
            return "/todos/{id}"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .get:
            return .get
        }
    }
    
    var headers: [HTTPHeader] {
        return []
    }
    
    var parameters: ParametersRepresentable? {
        switch self {
        case .get(let id):
            return Parameter.path(key: "id", value: "\(id)")
        }
    }
}
