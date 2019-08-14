//
//  ApiPokemon.swift
//  pokemondex
//
//  Created by MacMini2012 on 8/14/19.
//  Copyright © 2019 Pokemondex. All rights reserved.
//

import ObjectMapper

class ApiPokemon {
    
    var pokemonId = ""
    var name = ""
    var image = ""
    var description = ""
    var pokemonTypes = [String]()
    
    required public init?(map: Map) {
        
    }
    
    func convert() -> Pokemon {
        return Pokemon(
            id: pokemonId,
            name: name,
            image: image,
            description: description,
            pokemonTypes: pokemonTypes
        )
    }
}

extension ApiPokemon: Mappable {
    func mapping(map: Map) {
        pokemonId       <- map["id"]
        name            <- map["name"]
        image           <- map["image"]
        description     <- map["description"]
        pokemonTypes    <- map["pokemonTypes"]
    }
}
