//
//  MovieRepository.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 17.12.2020.
//

import Foundation

class MovieRepository {
    
    var movieNetworking: Networking
    
    init(movieNetworking: Networking) {
        self.movieNetworking = movieNetworking
    }
    
    func getMovies(success: @escaping ([Movie]) -> Void, failure: @escaping (String) -> Void) {
        let request = MovieRequest()
        movieNetworking.call(request: request) { (response) in
            success(response.results)
        } onError: { (error) in
            failure(error.description)
        }
    }
    
    func getMoviesBySearch(success: @escaping ([Movie]) -> Void, failure: @escaping (String) -> Void, text: String) {
        let request = SearchMovieRequest(text: text)
        movieNetworking.call(request: request) { (response) in
            success(response.results)
        } onError: { (error) in
            failure(error.description)
        }
    }
}
