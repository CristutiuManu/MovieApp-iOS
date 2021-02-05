//
//  GenreViewModel.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 13.12.2020.
//

import Foundation

class GenreViewModel {
    
    private var router: GenreRouter
    private var repository: GenresRepository
    
    init(router: GenreRouter, repository: GenresRepository) {
        self.router = router
        self.repository = repository
    }
    
    func getGenresNetworking(success: @escaping ([Genre]) -> Void, failure: @escaping (String) -> Void) {
        repository.getGenres(success: success, failure: failure)
    }
    
    
}
