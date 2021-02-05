//
//  BaseRequest.swift
//  Networking
//
//  Created by Sebastian Sarca on 16/08/2018.
//  Copyright © 2018 Mobiversal. All rights reserved.
//

import Foundation

open class BaseRequest<Resp: Response>: ApiRequest {
    
    open var method: ApiMethod {
        fatalError("Should implement in higher classes")
    }
    
    public typealias ApiResponse = Resp
    
    public let headers: [String : String]
    public let parameters: [String : Any]
    
    public let fetchQueue: NetworkingQueueType
    public var resultQueue: NetworkingQueueType
    
    public init(headers: [String: String] = [:], parameters: [String: Any] = [:], fetchQueue: NetworkingQueueType = .background, resultQueue: NetworkingQueueType = .main ) {
        self.headers = headers
        self.parameters = parameters
        self.fetchQueue = fetchQueue
        self.resultQueue = resultQueue
    }
}

extension BaseRequest: CustomStringConvertible {
    public var description: String {
        return """
        
        Request: \(type(of: self))
        Method: \(method)
        Headers: \(headers)
        Parameters: \(parameters)
        Response: \(ApiResponse.self)
        """
    }
}
