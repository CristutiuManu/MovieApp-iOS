//
//  ActorDetailRequest.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 15.12.2020.
//

import Foundation

class ActorDetailsRequest: BaseRequest<GetActorDetails> {

var id: Int

init(id: Int) {
    self.id = id
    }

    override var method: ApiMethod {
        .get("person/\(id)?api_key=d773193a88ede0c03b5da21759b8dea6&language=en-US")
    }
    
}
