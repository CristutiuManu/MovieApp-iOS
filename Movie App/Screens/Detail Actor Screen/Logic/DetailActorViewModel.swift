//
//  DetailActorViewModel.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 14.12.2020.
//

import Foundation

class DetailActorViewModel {
    
    private let router: DetailActorRouter
    private let repository: ActorDetailsRepository
    static var id: Int = 1
    
    init(router: DetailActorRouter, repository: ActorDetailsRepository, id: Int) {
        self.router = router
        self.repository = repository
        DetailActorViewModel.id = id
    }
    
    func getActorDetailsNetworking(success: @escaping (ActorDetails?) -> Void, failure: @escaping (String) -> Void, id: Int) {
        repository.getActorDetails(success: success, failure: failure, id: id)
    }
}
