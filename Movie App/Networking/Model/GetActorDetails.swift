//
//  GetActorDetailsResponse.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 20/10/2020.
//

import Foundation

struct GetActorDetails: Response {
    let results: ActorDetails
    
    init(from decoder: Decoder) throws {
      let container = try decoder.singleValueContainer()
      self.results = try container.decode(ActorDetails.self)
    }
}

