//
//  SplashViewModel.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 10.12.2020.
//

import Foundation

class SplashViewModel {
    private let router: SplashRouter
    private let service: Service
    
    init(router: SplashRouter, service: Service) {
        self.router = router
        self.service = service
    }
    
    func startHome() {
        router.startHome()
    }
}
