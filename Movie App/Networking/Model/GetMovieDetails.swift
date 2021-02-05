//
//  GetMovieDetailsResponse.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 30/10/2020.
//

import Foundation

struct GetMovieDetails: Response {
    var results: MovieDetails
    
    init(from decoder: Decoder) throws {
      let container = try decoder.singleValueContainer()
      self.results = try container.decode(MovieDetails.self)
    }
    
}
