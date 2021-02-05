//
//  ActorsRepository.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 16.12.2020.
//

import UIKit
class ActorsRepository {
    
    var actorsNetworking: Networking
    
    init(actorsNetworking: Networking) {
        self.actorsNetworking = actorsNetworking
    }
    
    func getActors(success: @escaping ([Actor]) -> Void, failure: @escaping (String) -> Void) {
        let request = ActorsRequest()
        actorsNetworking.call(request: request) { (response) in
            success(response.results)
        } onError: { (error) in
            failure(error.description)
        }
    }
    
    func getActorsBySearch(success: @escaping ([Actor]) -> Void, failure: @escaping (String) -> Void, text: String) {
        let request = SearchActorsRequest(text: text)
        actorsNetworking.call(request: request) { (response) in
            success(response.results)
        } onError: { (error) in
            failure(error.description)
        }
    }
}
