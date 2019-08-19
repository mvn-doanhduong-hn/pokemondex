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
            return "pokemons/search?name=\(name)"
        case .pokemon(let id):
            return "pokemons/\(id)"
        case .items:
            return "items"
        case .searchItems(let name):
            return "items/search?name=\(name)"
        case .item(let name):
            return "items/\(name)"
        case .moves:
            return "moves"
        case .searchMoves(let name):
            return "moves/search?name=\(name)"
        case .move(let name):
            return "moves/\(name)"
        }
    }
    
    func url(for environment: ApiEnvironment) -> String {
        return "\(environment.url)/\(path)"
    }
}
