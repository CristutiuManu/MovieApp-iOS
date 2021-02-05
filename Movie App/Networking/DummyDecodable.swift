//
//  ApiArrayResponse.swift
//  Spitalul judetean
//
//  Created by Andrei Tanc on 28/09/2020.
//  Copyright © 2020 Mobiversal. All rights reserved.
//

import Foundation

open class ApiArrayResponse<Element: Decodable>: Response {
    
    open var elements: [Element]
    
    public required init(from decoder: Decoder) throws {
        var elements = [Element]()
        var container = try decoder.unkeyedContainer()
        while !container.isAtEnd {
            if let route = try? container.decode(Element.self) {
                elements.append(route)
            } else {
                _ = try? container.decode(DummyDecodable.self) // <-- TRICK
            }
        }
        self.elements = elements
    }
}
private class DummyDecodable: Decodable {}
