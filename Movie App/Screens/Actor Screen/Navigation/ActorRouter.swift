//
//  ActorRouter.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 13.12.2020.
//

import Foundation
class ActorRouter: MainRouter {
    
    func startActor() {
        let repository = ActorsRepository(actorsNetworking: networking)
        let viewModel = ActorViewModel(router: self, repository: repository)
        let vc = ActorsViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func startDetailActor(id: Int) {
        let router = DetailActorRouter(navigationController: navigationController, networking: networking)
        router.startDetailActor(id: id)
    }
}
