//
//  DetailActorRouter.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 14.12.2020.
//

import UIKit

class DetailActorRouter: MainRouter {
    
    func startDetailActor(id: Int) {
        let repository = ActorDetailsRepository(actorDetailsNetworking: networking)
        let viewModel = DetailActorViewModel(router: self, repository: repository, id: MovieDetailsViewModel.id)
        let preferencesVC = ActorDetailsViewController(id: id, viewModel: viewModel)
        navigationController.pushViewController(preferencesVC, animated: true)
    
    }
    
}
