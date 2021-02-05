//
//  MovieDetails.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 30/10/2020.
//

import Foundation

struct MovieDetails: Decodable {
    
    var id: Int
    var title: String
    var posterPath: String?
    var releaseDate: String?
    var overview: String?
    
    init(id: Int, title: String, posterPath: String?, releaseDate: String, overview: String?) {
        self.id = id
        self.title = title;
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.overview = overview
    }
    
    init() {
        id = 1
        title = "Lucas"
        posterPath = "342r2"
        releaseDate = "10.10.2010"
        overview = "faa"
    }
    
   private enum CodingKeys: String, CodingKey {
    case id, title, posterPath, releaseDate, overview
    }
    
}

