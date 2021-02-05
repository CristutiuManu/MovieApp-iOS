//
//  DetailActorService.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 15.12.2020.
//

import UIKit

class ActorDetailsRepository {
    
    var actorDetailsNetworking: Networking
    
    init(actorDetailsNetworking: Networking) {
        self.actorDetailsNetworking = actorDetailsNetworking
    }
    
    func getActorDetails(success: @escaping (ActorDetails?) -> Void, failure: @escaping (String) -> Void, id: Int) {
        let request = ActorDetailsRequest(id: id)
        actorDetailsNetworking.call(request: request) { (response) in
            success(response.results)
        } onError: { (error) in
            failure(error.description)
        }
    }
    
    
    
}
