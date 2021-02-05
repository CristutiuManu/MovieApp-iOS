//
//  ActorViewModel.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 13.12.2020.
//

import Foundation

class ActorViewModel {
    private let router: ActorRouter
    private let repository: ActorsRepository
    
    init(router: ActorRouter, repository: ActorsRepository) {
        self.router = router
        self.repository = repository
    }
    
    func startActor() {
        router.startActor()
        }
    
    func startDetailActor(id: Int) {
        router.startDetailActor(id: id)
    }
    
    func getActorsNetworking(success: @escaping ([Actor]) -> Void, failure: @escaping (String) -> Void) {
        repository.getActors(success: success, failure: failure)
    }
    
    func getActorsNetworkingBySearch(success: @escaping ([Actor]) -> Void, failure: @escaping (String) -> Void, text: String) {
        repository.getActorsBySearch(success: success, failure: failure, text: text)
    }
    
//    func getActorsNetworking() {
//        let actorsRepository = ActorsRepository(actorsNetworking: networking)
//        let decoder = Decoder.self
//        let actors = GetActorsResponse()
//        actorsRepository.getActors(success: actors, failure: "nil")
//    }
    
}
