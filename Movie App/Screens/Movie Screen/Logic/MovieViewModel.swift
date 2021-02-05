//
//  MovieViewModel.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 13.12.2020.
//

import Foundation

class MovieViewModel {
    
    private let router: MovieRouter
    private let repository: MovieRepository
    
    init(router: MovieRouter, repository: MovieRepository) {
        self.router = router
        self.repository = repository
    }
    
    
    func startMovie() {
        router.startMovie()
    }
    
    func startDetailMovie(id: Int) {
        router.startDetailMovie(id: id)
    }
    
    func getMoviesNetworking(success: @escaping ([Movie]) -> Void, failure: @escaping (String) -> Void) {
        repository.getMovies(success: success, failure: failure)
    }
    
    func getMoviesNetworkingBySearch(success: @escaping ([Movie]) -> Void, failure: @escaping (String) -> Void, text: String) {
        repository.getMoviesBySearch(success: success, failure: failure, text: text)
    }

}
