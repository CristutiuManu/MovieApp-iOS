//
//  MovieRouter.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 13.12.2020.
//

import UIKit

class MovieRouter: MainRouter {
    
    func startMovie() {
        let repository = MovieRepository(movieNetworking: networking)
        let viewModel = MovieViewModel(router: self, repository: repository)
        let preferencesVC = MoviesViewController(viewModel: viewModel)
        navigationController.pushViewController(preferencesVC, animated: true)
    }
    
    func startDetailMovie(id: Int) {
        let router = DetailMovieRouter(navigationController: navigationController, networking: networking)
        router.startDetailMovie(id: id)
    }
    
}
