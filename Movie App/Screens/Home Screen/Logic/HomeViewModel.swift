//
//  HomeViewModel.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 10.12.2020.
//

import Foundation

class HomeViewModel {
    private var router: HomeRouter
    private var service: Service
    
    init(router: HomeRouter, service: Service) {
        self.router = router
        self.service = service
    }
    
    func startActor() {
        router.startActor()
    }
    
    func startGenre() {
        router.startGenre()
    }
    
    func startMovie() {
        router.startMovie()
    }
}
