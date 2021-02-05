//
//  Networking.swift
//  Networking
//
//  Created by Sebastian Sarca on 11/06/2018.
//  Copyright © 2018 Mobiversal. All rights reserved.
//

import Foundation
import Alamofire
import Combine

public typealias Success<T> = (T) -> Void
public typealias Fail = (ApiError) -> Void

public protocol Networking {
    var isReachable: Bool {get}

    init(config: Config)
    
    //    func add(interceptor: NetworkingInterceptor)
    func observeConnection(observer: @escaping (Bool) -> Void)

    @discardableResult
    func call<Req>(request: Req, onSuccess: @escaping Success<Req.ApiResponse>, onError: @escaping Fail) -> CancelableRequest where Req: ApiRequest
    
  func invalidateSession()
}

public struct Config {
    public var baseUri: String
    public var globalHeaders: HTTPHeaders
    
    public init(baseUri: String, globalHeaders: HTTPHeaders = Config.defaultGlobalHeaders()) {
        self.baseUri = baseUri
        self.globalHeaders = globalHeaders
    }
    
    public static func defaultGlobalHeaders() -> HTTPHeaders {
        return HTTPHeaders(arrayLiteral: .contentType("application/json"))
    }
}

public enum NetworkingQueueType {
    case main
    case background
    case custom(DispatchQueue)
}

public protocol CancelableRequest {
    func cancelRequest()
}
