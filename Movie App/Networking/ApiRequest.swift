//
//  ApiRequest.swift
//  Networking
//
//  Created by Sebastian Sarca on 11/06/2018.
//  Copyright © 2018 Mobiversal. All rights reserved.
//

import Foundation

public protocol ApiRequest {
    
    associatedtype ApiResponse: Response
    
    var fetchQueue: NetworkingQueueType {get}
    var resultQueue: NetworkingQueueType {get}
    
    var method: ApiMethod {get}
    var parameters: [String: Any] {get}
    var headers: [String: String] {get}
}
