//
//  DetailActorViewModel.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 13.12.2020.
//

import Foundation

class MovieDetailsViewModel {
    
    private var router: DetailMovieRouter
    private var repository: MovieDetailRepository
    static var id: Int = 1
    
    init(router: DetailMovieRouter, repository: MovieDetailRepository, id: Int) {
        self.router = router
        self.repository = repository
        MovieDetailsViewModel.id = id
    }
    
    func getMovieDetailsNetworking(success: @escaping (MovieDetails?) -> Void, failure: @escaping (String) -> Void, id: Int) {
        repository.getMovieDetails(success: success, failure: failure, id: id)
    }
    
    
}
