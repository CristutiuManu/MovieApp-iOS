//
//  File.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 12/10/2020.
//

import Foundation
import Alamofire

class Service {
    
    fileprivate var baseUrl = ""
    typealias genresCallBack = (_ genres:[Genre]?, _ status: Bool, _ message: String) -> Void
    typealias actorsCallBack = (_ actors:[Actor]?, _ status: Bool, _ message: String) -> Void
    typealias moviesCallBack = (_ movies: [Movie]?, _ status: Bool, _ message: String) -> Void
    typealias detailActorsCallBack = (_ actorDetails: ActorDetails?, _ status: Bool, _ message: String) -> Void
    typealias detailMoviesCallBack = (_ movieDetails: MovieDetails?, _ status: Bool, _ message: String) -> Void
    // Study Generics first! 
    var callBackGenres: genresCallBack?
    var callBackActors: actorsCallBack?
    var callBackMovies: moviesCallBack?
    var callBackDetailsActor: detailActorsCallBack?
    var callBackDetailsMovie: detailMoviesCallBack?
    
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    // Genres Request
    func getAllGenresByName(endPoint: String) {
        
        AF.request(self.baseUrl + endPoint, method: .get, parameters: nil, encoding: URLEncoding.default,headers: nil, interceptor: nil).response
        {
            (responseData) in
            print("We got the connection for genres")
            guard let data = responseData.data
            else {self.callBackGenres?(nil, false, "")
                return
            }
            do {
                let response = try JSONDecoder().decode(GetGenres.self, from: data)
                self.callBackGenres?(response.genres, true,"")
            } catch {
                self.callBackGenres?(nil, false, error.localizedDescription)
            }
        }
    }
    func completionHandlerGenres(callBack: @escaping genresCallBack) {
        self.callBackGenres = callBack
    }
    
    //Actors Request
    func getAllActorsByName(endPoint: String) {
        
        AF.request(self.baseUrl + endPoint, method: .get, parameters: nil, encoding: URLEncoding.default,headers: nil, interceptor: nil).response
        {
            (responseData) in
            print("We got the connection for actors")
            guard let data = responseData.data
            else {self.callBackActors?(nil, false, "")
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let response = try decoder.decode(GetActors.self, from: data)
                self.callBackActors?(response.results, true,"")
            } catch {
                self.callBackActors?(nil, false, error.localizedDescription)
            }
        }
        func completionHandlerActors(callBack: @escaping actorsCallBack) {
            self.callBackActors = callBack
        }
    }
    
    //Details Actor Request
    func getActorDetails(endPoint: String) {
    
        AF.request(self.baseUrl + endPoint, method: .get, parameters: nil, encoding: URLEncoding.default,headers: nil, interceptor: nil).response
        {
            (responseData) in
            print("We got the connection for actorsDetail")
            guard let data = responseData.data
            else {self.callBackDetailsActor?(nil, false, "")
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let response = try decoder.decode(GetActorDetails.self, from: data)
                self.callBackDetailsActor?(response.results, true,"")
            } catch {
                self.callBackDetailsActor?(nil, false, error.localizedDescription)
            }
        }
        func completionHandlerDetailActors(callBack: @escaping detailActorsCallBack) {
            self.callBackDetailsActor = callBack
        }
    }
    
    //Movies request
    func getAllMoviesByName(endPoint: String) {
        
        AF.request(self.baseUrl + endPoint, method: .get, parameters: nil, encoding: URLEncoding.default,headers: nil, interceptor: nil).response
        {
            (responseData) in
            print("We got the connection for movies")
            guard let data = responseData.data
            else {self.callBackMovies?(nil, false, "")
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let response = try decoder.decode(GetMovies.self, from: data)
                self.callBackMovies?(response.results, true,"")
            } catch {
                self.callBackMovies?(nil, false, error.localizedDescription)
            }
        }
        func completionHandlerMovies(callBack: @escaping moviesCallBack) {
            self.callBackMovies = callBack
        }
    }
    
    
    //Details Movie Request
    
    func getMovieDetails(endPoint: String) {
        
        AF.request(self.baseUrl + endPoint, method: .get, parameters: nil, encoding: URLEncoding.default,headers: nil, interceptor: nil).response
        {
            (responseData) in
            print("We got the connection for actorsDetail")
            guard let data = responseData.data
            else {self.callBackDetailsMovie?(nil, false, "")
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let response = try decoder.decode(GetMovieDetails.self, from: data)
                self.callBackDetailsMovie?(response.results, true,"")
            } catch {
                self.callBackDetailsMovie?(nil, false, error.localizedDescription)
            }
        }
        func completionHandlerDetailMovies(callBack: @escaping detailMoviesCallBack) {
            self.callBackDetailsMovie = callBack
        }
    }
    
}
