//
//  RequestData.swift
//  FVNetworking
//
//  Created by Sebastian Sarca on 13/09/2018.
//  Copyright © 2018 Mobiversal. All rights reserved.
//

import Foundation
import Alamofire

struct RequestData {
    let uri: String
    let method: HTTPMethod
    let headers: HTTPHeaders
    let encoding: ParameterEncoding
    let parameters: [String: Any]?
    
    init<T: ApiRequest>(request: T, config: Config) {
        uri = request.method.getUri(base: config.baseUri)
        method = RequestData.toAlamofire(method: request.method)
        headers = RequestData.headers(for: request, config: config)
        encoding = method == .get ? URLEncoding.default : JSONEncoding.prettyPrinted
        parameters = request.parameters.count == 0 ? [:] : request.parameters
    }
    
    private static func headers<T: ApiRequest>(for request: T, config: Config) -> HTTPHeaders {
        var headers = config.globalHeaders
        request.headers.forEach({headers[$0.key] = $0.value})
        return headers
    }
    
    private static func toAlamofire(method: ApiMethod) -> HTTPMethod {
        switch method {
        case .post:
            return HTTPMethod.post
        case .get:
            return HTTPMethod.get
        case .put:
            return HTTPMethod.put
        case .delete:
            return HTTPMethod.delete
        }
    }
}
