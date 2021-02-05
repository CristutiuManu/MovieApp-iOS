//
//  MovieDetailRequest.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 15.12.2020.
//

import Foundation

class MovieDetailsRequest: BaseRequest<GetMovieDetails> {

    var id: Int

    init(id: Int) {
        self.id = id
        }

    override var method: ApiMethod {
        .get("movie/\(id)?api_key=d773193a88ede0c03b5da21759b8dea6&language=en-US")
    }

}
