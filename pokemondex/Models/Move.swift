//
//  Move.swift
//  pokemondex
//
//  Created by MacMini2012 on 8/14/19.
//  Copyright © 2019 Pokemondex. All rights reserved.
//

import ObjectMapper

struct Move {
    var name: String
    var type: PokemonType
    var effects: String
    var power: Int
    var accuracy: String
    var pp: Int
}
