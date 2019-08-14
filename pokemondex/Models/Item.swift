//
//  Item.swift
//  pokemondex
//
//  Created by MacMini2012 on 8/14/19.
//  Copyright © 2019 Pokemondex. All rights reserved.
//

import ObjectMapper

class Item:  Mappable {
    var name: String?
    var price: Float?
    var image: String!
    var effects: String?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        name            <- map["name"]
        price           <- map["price"]
        image           <- map["image"]
        effects         <- map["effects"]
    }
}


