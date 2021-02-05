//
//  UserDefaults.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 28/10/2020.
//

import Foundation


enum ListType: String {
    case favorite_actors
    case favorite_genres
    case favorite_movies
    case watched_movies
}

class Saving {
    
    static private let userDefaultsStandard = UserDefaults.standard
    private class func getIds(forKey key: String) -> [Int] {
        if let ids = userDefaultsStandard.object(forKey: key) as? [Int] {
            return ids
        } else {
            return []
        }
    }
    class var wereSavedActors: Bool {
        return !(listForType(type: .favorite_actors).isEmpty)
    }
    class var wereSavedGenres: Bool {
        return !(listForType(type: .favorite_genres).isEmpty)
    }
    class var wereFavoriteMovies: Bool{
        return !(listForType(type: .favorite_movies).isEmpty)
    }
    class var wereWatchedMovies: Bool {
        return !(listForType(type: .watched_movies).isEmpty)
    }
    
    class func listForType(type: ListType) -> [Int]{
        Saving.getIds(forKey: type.rawValue)
    }
    
    // Set and Get for Actors
    class func setButtonActors(isSelected: Bool, actorId: Int) {
        var selectedActors = listForType(type: .favorite_actors)
        if isSelected {
            selectedActors.append(actorId)
        } else if let index = selectedActors.firstIndex(of: actorId) {
            selectedActors.remove(at: index)
        }
        
        Saving.userDefaultsStandard.set(selectedActors, forKey: ListType.favorite_actors.rawValue)
        Saving.userDefaultsStandard.synchronize()
    }
    
    class func getButtonActorsValue(actorId: Int) -> Bool {
        return Saving.listForType(type: .favorite_actors).contains(actorId)
    }
    
    //Set and Get for genres
    class func setButtonGenres(isSelected: Bool, genreId: Int) {
        var selectedGenres = listForType(type: .favorite_genres)
        if isSelected {
            selectedGenres.append(genreId)
        } else if let index = selectedGenres.firstIndex(of: genreId) {
            selectedGenres.remove(at: index)
        }
        
        Saving.userDefaultsStandard.set(selectedGenres, forKey: ListType.favorite_genres.rawValue)
        Saving.userDefaultsStandard.synchronize()
    }
    
    class func getButtonGenresValue(genreId: Int) -> Bool {
        return Saving.listForType(type: .favorite_genres).contains(genreId)
    }
    
    class func saveGenres(genreItems: [GenreItem]) {
        var favoriteGenres = Set<Int>()
        genreItems.forEach{ if ($0.isSelected){
            favoriteGenres.insert($0.id)
            }
        }
        Saving.userDefaultsStandard.removeObject(forKey: ListType.favorite_genres.rawValue)
        Saving.userDefaultsStandard.set(Array(favoriteGenres),forKey: ListType.favorite_genres.rawValue)
    }
    
    // Set and Get for favorite movies
    
    
}

