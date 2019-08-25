//
//  PokemonDetailResponse.swift
//  pokemondex
//
//  Created by LTT on 8/25/19.
//  Copyright © 2019 Pokemondex. All rights reserved.
//

import ObjectMapper

class PokemonDetailResponse: Mappable {
    var pokemon: PokemonResponse?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        pokemon <- map["pokemon"]
    }
}

class PokemonResponse: Mappable {
    
    var id: String?
    var name: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id      <- map["id"]
        name    <- map["name"]
    }    
}
