//
//  Connect.swift
//
//  Copyright (c) 2020 Tarek Sabry
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation
import Alamofire

public protocol ErrorHandlerProtocol {
    func handle(response: [String: Any]) -> Error?
}

open class ErrorHandler: ErrorHandlerProtocol {
    
    public func handle(response: [String: Any]) -> Error? {
        if let error = response["msg"] as? String {
            return ConnectError.unknownError(message: error)
        } else if let error = response["message"] as? String {
            return ConnectError.unknownError(message: error)
        } else if let error = response["error"] as? String {
            return ConnectError.unknownError(message: error)
        } else if let error = response["err"] as? String {
            return ConnectError.unknownError(message: error)
        }
        
        return ConnectError.internalServerError
    }
    
    public init() {}
}

open class Connect {
    
    private let middleware: ConnectMiddlewareProtocol
    private let errorHandler: ErrorHandlerProtocol
    
    private lazy var session: Session = middleware.session
    
    public static let `default`: Connect = Connect()
    
    public init(middleware: ConnectMiddlewareProtocol = ConnectMiddleware(), errorHandler: ErrorHandlerProtocol = ErrorHandler()) {
        self.middleware = middleware
        self.errorHandler = errorHandler
    }
    
    private func parseResponse(response: AFDataResponse<Data>) -> Error? {
        
        if (200 ..< 300).contains(response.response?.statusCode ?? 0) == false {
            guard let response = try? JSONSerialization.jsonObject(with: response.data ?? Data(), options: []) as? [String: AnyObject] else { return ConnectError.internalServerError }
            return errorHandler.handle(response: response)
        }

        return nil
    }
    
    public func request(_ request: Connector, debugResponse: Bool = false) -> Future<Data> {
        let promise = Promise<Data>()
        
        session.request(request).cURLDescription(calling: Request.debugLog).validate().responseData { [weak self] response in
            guard let self = self else { return }

            #if DEBUG
            if debugResponse {
                print((response.data ?? Data()).prettyPrintedJSONString ?? "")
            }
            #endif

            if let error = self.parseResponse(response: response) {
                promise.reject(with: error)
                return
            }
            
            switch response.result {
            case .success(let data):
                promise.resolve(with: data)
            case .failure(let error):
                promise.reject(with: error)
            }
        }
        
        return promise
    }

    public func upload(files: [File]?, to request: Connector, debugResponse: Bool = false) -> Future<Data> {
        let promise = Promise<Data>()
        session.upload(multipartFormData: { formData in

            if let files = files {
                files.forEach { file in
                    formData.append(file.data, withName: file.key, fileName: file.name, mimeType: file.mimeType.rawValue)
                }
            }

            if let parameters = request.parameters {
                if let parameter = parameters as? Parameter {
                    switch parameter {
                    case .jsonObject(let object):
                        try? object.asDictionary().forEach { key, value in
                            formData.append("\(value)".data(using: .utf8) ?? Data(), withName: key)
                        }
                    default:
                        break
                    }
                } else if let compositeParameters = parameters as? CompositeParameters {
                    compositeParameters.parameters.forEach { parameter in
                        switch parameter {
                        case .jsonObject(let object):
                            try? object.asDictionary().forEach { key, value in
                                formData.append("\(value)".data(using: .utf8) ?? Data(), withName: key)
                            }
                        default:
                            break
                        }
                    }
                }
            }

        }, with: request).cURLDescription(calling: Request.debugLog).validate().responseData { [weak self] response in
            guard let self = self else { return }
            
            #if DEBUG
            if debugResponse {
                print((response.data ?? Data()).prettyPrintedJSONString ?? "")
            }
            #endif

            if let error = self.parseResponse(response: response) {
                promise.reject(with: error)
                return
            }

            switch response.result {
            case .success(let data):
                promise.resolve(with: data)
            case .failure(let error):
                promise.reject(with: error)
            }
        }
        
        return promise
    }
    
    public func cancelAllRequests() {
        session.cancelAllRequests()
    }
}
