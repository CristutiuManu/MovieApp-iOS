//
//  SplashRouter.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 10.12.2020.
//

import UIKit

class SplashRouter: MainRouter {
    
    func startSplash() {
            let service = Service(baseUrl: "")
            let viewModel = SplashViewModel(router: self, service: service)
            let preferencesVC = SplashAnimationViewController(viewModel: viewModel)
            navigationController.pushViewController(preferencesVC, animated: true)
        }
    
    func startHome() {
        let startHome = HomeRouter(navigationController: navigationController, networking: networking)
        startHome.startHome()
    }
}
