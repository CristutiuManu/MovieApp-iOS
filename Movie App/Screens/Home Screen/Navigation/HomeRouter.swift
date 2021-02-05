//
//  Router.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 10.12.2020.
//

import UIKit

class HomeRouter: MainRouter {

    func startHome() {
        let service = Service(baseUrl: "")
        let router = HomeRouter(navigationController: navigationController, networking: networking)
        
        let viewModel = HomeViewModel(router: router, service: service)
        let vc = HomeViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func startActor() {
        let actorRouter = ActorRouter(navigationController: navigationController, networking: networking)
        actorRouter.startActor()
    }
    
    func startGenre() {
        let genreRouter = GenreRouter(navigationController: navigationController, networking: networking)
        genreRouter.startGenre()
    }
    
    func startMovie() {
        let movieRouter = MovieRouter(navigationController: navigationController, networking: networking)
        movieRouter.startMovie()
    }
}
