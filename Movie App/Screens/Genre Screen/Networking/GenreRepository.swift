//
//  GenreRepository.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 16.12.2020.
//

import Foundation

class GenresRepository {
    
    var genresNetworking: Networking
    
    init(genresNetworking: Networking) {
        self.genresNetworking = genresNetworking
    }
    
    func getGenres(success: @escaping ([Genre]) -> Void, failure: @escaping (String) -> Void) {
        let request = GenresRequest()
        genresNetworking.call(request: request) { (response) in
            success(response.genres)
        } onError: { (error) in
            failure(error.description)
        }
    }
}
