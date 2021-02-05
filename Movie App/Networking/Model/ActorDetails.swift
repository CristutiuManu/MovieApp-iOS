//
//  ActorDetails.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 20/10/2020.
//

import Foundation

struct ActorDetails: Decodable {
    
    var id: Int
    var name: String
    var profilePath: String?
    var birthday: String?
    var deathday: String?
    var biography: String?
 
    init(personId: Int, name: String, birthday: String?, profilePath: String?, deathday: String?, biography: String?) {
        self.id = personId
        self.name = name
        self.profilePath = profilePath
        self.birthday = birthday
        self.biography = biography
    }
    
    init() {
        id = 1
        name = "Lucas"
        profilePath = "342r2"
        birthday = "faa"
        biography = "gasga"
    }
    
   private enum CodingKeys: String, CodingKey {
    case id, name, profilePath, birthday, biography
    }
    
}
