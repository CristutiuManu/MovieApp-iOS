//
//  ApiMethod.swift
//  Networking
//
//  Created by Sebastian Sarca on 11/06/2018.
//  Copyright © 2018 Mobiversal. All rights reserved.
//

import Foundation

public enum ApiMethod {
    case get(String)
    case post(String)
    case put(String)
    case delete(String)
    
    public func getUri(base: String) -> String {
        switch self {
        case .get(let uri), .post(let uri), .put(let uri), .delete(let uri):
            return base + uri
        }
    }
}
