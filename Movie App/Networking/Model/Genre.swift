//
//  Genre.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 09/10/2020.
//

import Foundation

struct Genre: Decodable {
    
    var id : Int
    var name : String?
    
    init(id: Int, name: String?) {
        self.id = id
        self.name = name
    }
 
     enum CodingKeys: String, CodingKey {
        case id
        case name = "name"
    }
    
}
