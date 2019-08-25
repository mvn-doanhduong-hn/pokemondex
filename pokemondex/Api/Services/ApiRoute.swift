//
//  ApiRouter.swift
//  pokemondex
//
//  Created by MacMini2012 on 8/14/19.
//  Copyright © 2019 Pokemondex. All rights reserved.
//

import Foundation
import Alamofire

enum ApiRoute { case
    
    pokemons,
    searchPokemons(name: String),
    pokemon(id: String),
    items,
    searchItems(name: String),
    item(name: String),
    moves,
    searchMoves(name: String),
    move(name: String)
    
    var path: String {
        switch self {
        case .pokemons:
            return "pokemons"
        case .searchPokemons(let name):
            let newName = name.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)
            return "pokemons/search?name=\(newName)"
        case .pokemon(let id):
            return "pokemons/\(id)"
        case .items:
            return "items"
        case .searchItems(let name):
             let newName = name.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)
            return "items/search?name=\(newName)"
        case .item(let name):
             let newName = name.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)
            return "items/\(newName)"
        case .moves:
            return "moves"
        case .searchMoves(let name):
             let newName = name.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)
            return "moves/search?name=\(newName)"
        case .move(let name):
             let newName = name.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)
            return "moves/\(newName)"
        }
    }
    
    func url(for environment: ApiEnvironment) -> String {
        return "\(environment.url)/\(path)"
    }
}
