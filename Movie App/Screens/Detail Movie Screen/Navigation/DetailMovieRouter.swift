//
//  DetailActorRouter.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 13.12.2020.
//

import UIKit

class DetailMovieRouter: MainRouter {
    
    func startDetailMovie(id: Int) {
        let repository = MovieDetailRepository(movieDetailsNetworking: networking)
        let viewModel = MovieDetailsViewModel(router: self,repository: repository, id: MovieDetailsViewModel.id)
        let preferencesVC = MovieDetailsViewController(id: id, viewModel: viewModel)
        navigationController.pushViewController(preferencesVC, animated: true)
    }
    
}
