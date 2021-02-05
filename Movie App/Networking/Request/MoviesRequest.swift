//
//  MoviesRequest.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 15.12.2020.
//

import Foundation
class MovieRequest: BaseRequest<GetMovies> {
    
    override var method: ApiMethod {
        .get("movie/popular?api_key=d773193a88ede0c03b5da21759b8dea6&language=en-US&page=1")
    }
    
}
