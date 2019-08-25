//
//  ApiMove.swift
//  pokemondex
//
//  Created by MacMini-PC on 14/08/2019.
//  Copyright © 2019 Pokemondex. All rights reserved.
//
import ObjectMapper

class ApiMove {
    
    var name = ""
    var type = ""
    var effects = ""
    var power = 0
    var accuracy = 0
    var pp = 0
    
    required init?(map: Map) {
        
    }
    
    func convert() -> Move {
        return Move(
            name: name,
            type: PokemonType(rawValue: type) ?? PokemonType.normal,
            effects: effects,
            power: power,
            accuracy: accuracy,
            pp: pp
        )
    }
}

extension ApiMove: Mappable {
    // Mappable
    func mapping(map: Map) {
        name            <- map["name"]
        type            <- map["type"]
        effects         <- map["effects"]
        power           <- map["power"]
        accuracy        <- map["accuracy"]
        pp              <- map["pp"]
    }
}
