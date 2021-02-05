//
//  SearchMovieRequest.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 17.12.2020.
//

import Foundation

class SearchMovieRequest: BaseRequest<GetMovies> {
    
    var text: String
    
    init(text: String) {
        self.text = text
    }
    
    override var method: ApiMethod {
        .get("search/movie?api_key=d773193a88ede0c03b5da21759b8dea6&language=en-US&page=1&query=\(text)")
    }
}
