//
//  MovieDetailRepository.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 17.12.2020.
//

import Foundation

class MovieDetailRepository {
    var movieDetailsNetworking: Networking
    
    init(movieDetailsNetworking: Networking) {
        self.movieDetailsNetworking = movieDetailsNetworking
    }
    
    func getMovieDetails(success: @escaping (MovieDetails?) -> Void, failure: @escaping (String) -> Void, id: Int) {
        let request = MovieDetailsRequest(id: id)
        movieDetailsNetworking.call(request: request) { (response) in
            success(response.results)
        } onError: { (error) in
            failure(error.description)
        }
    }
    
}
