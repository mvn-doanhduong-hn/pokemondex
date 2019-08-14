//
//  Move.swift
//  pokemondex
//
//  Created by MacMini2012 on 8/14/19.
//  Copyright © 2019 Pokemondex. All rights reserved.
//

import ObjectMapper

class Move: Mappable {
    var name: String?
    var type: String?
    var effects: String?
    var power: Int!
    var accuracy: String!
    var pp: Int!
    
    required init?(map: Map) {
        
    }
    
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
