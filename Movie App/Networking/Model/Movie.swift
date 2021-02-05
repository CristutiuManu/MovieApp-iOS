//
//  Movie.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 19/10/2020.
//

import Foundation

struct Movie: Decodable {
    
    var id: Int
    var title: String
    var posterPath: String?
    var releaseDate: String?
    var overview: String?
    
    init(id: Int, title: String, posterPath: String?, releaseDate: String?, overview: String?) {
        self.id = id
        self.title = title
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.overview = overview
    }
 
    public var description: String { return "Movie: \(id),\(title)"}
    
    private enum CodingKeys: String, CodingKey {
        case id, title, posterPath, releaseDate, overview
    }
    
}
