//
//  GenresRequest.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 15.12.2020.
//

import Foundation
class GenresRequest: BaseRequest<GetGenres> {
    
    override var method: ApiMethod {
        .get("genre/movie/list?api_key=d773193a88ede0c03b5da21759b8dea6&language=en-US")
    }
}
