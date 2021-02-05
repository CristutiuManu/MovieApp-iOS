//
//  Actor.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 09/10/2020.
//

import Foundation

struct Actor: Decodable {
    
    var id : Int
    var profilePath : String?
    var name : String
  
    init(id: Int, profilePath: String?,name: String) {
        self.id = id
        self.profilePath = profilePath
        self.name = name
    }
   
    public var description: String { return "Actor: \(id),\(name)" }
    
   private enum CodingKeys: String, CodingKey {
        case id, name, profilePath
    }

}
