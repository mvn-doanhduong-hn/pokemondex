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
    pokemonDetail(id: String),
    items,
    searchItems(name: String),
    itemDetail(name: String),
    moves,
    searchMoves(name: String),
    moveDetail(name: String)
    
    var path: String {
        switch self {
        case .pokemons:
            return "pokemons"
        case .searchPokemons(let name):
            return "pokemons/search/\(name)"
        case .pokemonDetail(let id):
            return "pokemons/\(id)"
        case .items:
            return "items"
        case .searchItems(let name):
            return "items/search/\(name)"
        case .itemDetail(let name):
            return "items/\(name)"
        case .moves:
            return "moves"
        case .searchMoves(let name):
            return "moves/search/\(name)"
        case .moveDetail(let name):
            return "moves/\(name)"
        }
    }
    
    func url(for environment: ApiEnvironment) -> String {
        return "\(environment.url)/\(path)"
    }
}
