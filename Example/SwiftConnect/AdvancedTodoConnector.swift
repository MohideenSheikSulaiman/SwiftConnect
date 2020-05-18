//
//  AdvancedTodoConnector.swift
//  Connect_Example
//
//  Created by Tarek Sabry on 5/18/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import SwiftConnect

enum TodoAction: String {
    case update
}

enum AdvancedTodoConnector: Connector {
    
    case update(userId: Int, todoId: Int, action: TodoAction, object: Encodable)
    
    var baseURL: URL {
        return URL(string: "https://myserver.com")!
    }
    
    var endpoint: String {
        switch self {
        case .update:
            return "/users/{userId}/todos/{todoId}"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .update:
            return .put
        }
    }
    
    var headers: [HTTPHeader] {
        return []
    }
    
    var parameters: ParametersRepresentable? {
        switch self {
        case .update(let userId, let todoId, let action, let object):
            return CompositeParameters(
                .path(key: "userId", value: "\(userId)"),
                .path(key: "todoId", value: "\(todoId)"),
                .query(key: "action", value: action.rawValue),
                .jsonObject(value: object)
            )
        }
    }
}
