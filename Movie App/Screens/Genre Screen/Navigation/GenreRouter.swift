//
//  GenreRouter.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 13.12.2020.
//

import UIKit

class GenreRouter: MainRouter {
    
    func startGenre() {
        let repository = GenresRepository(genresNetworking: networking)
        let viewModel = GenreViewModel(router: self, repository: repository)
        let preferencesVC = GenresViewController(id: 1, viewModel: viewModel)
        navigationController.modalTransitionStyle = .crossDissolve
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.pushViewController(preferencesVC, animated: true)
    }
    
}
