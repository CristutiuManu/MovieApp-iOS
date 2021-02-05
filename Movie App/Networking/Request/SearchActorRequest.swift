//
//  SearchActorResponse.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 16.12.2020.
//

import Foundation

class SearchActorsRequest: BaseRequest<GetActors> {
    
    var text: String
    
    init(text: String) {
        self.text = text
    }
    
    override var method: ApiMethod {
        .get("search/person?api_key=d773193a88ede0c03b5da21759b8dea6&language=en-US&query=\(text)")
    }
}
