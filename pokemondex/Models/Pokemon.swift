//
//  Pokemon.swift
//  pokemondex
//
//  Created by MacMini2012 on 8/14/19.
//  Copyright © 2019 Pokemondex. All rights reserved.
//

import ObjectMapper

struct Pokemon {
    var id: String
    var name: String
    var image: String
    var description: String
    var pokemonTypes: [PokemonType]    
}
