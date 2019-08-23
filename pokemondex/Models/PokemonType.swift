//
//  PokemonType.swift
//  pokemondex
//
//  Created by LTT on 8/20/19.
//  Copyright © 2019 Pokemondex. All rights reserved.
//

import Foundation

enum PokemonType: String {
    
    case normal = "NORMAL"
    case fire = "FIRE"
    case water = "WATER"
    case electric = "ELECTRIC"
    case grass = "GRASS"
    case ice = "ICE"
    case fighting = "FIGHTING"
    case poison = "POISON"
    case ground = "GROUND"
    case flying = "FLYING"
    case psychic = "PSYCHIC"
    case bug = "BUG"
    case rock = "ROCK"
    case ghost = "GHOST"
    case dragon = "DRAGON"
    case dark = "DARK"
    case steel = "STEEL"
    case fairy = "FAIRY"
    
    var value: String {
        return rawValue
    }
    
    var image: String {
        return "type_\(value).png"
    }
}
