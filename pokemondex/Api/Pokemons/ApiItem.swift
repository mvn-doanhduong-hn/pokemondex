//
//  ApiItem.swift
//  pokemondex
//
//  Created by MacMini-PC on 14/08/2019.
//  Copyright © 2019 Pokemondex. All rights reserved.
//

import ObjectMapper

class ApiItem {
    
    var name = ""
    var price = Int(0)
    var image = ""
    var effects = ""
    
    required public init?(map: Map) {
        
    }
        
    func convert() -> Item {
        return Item(
            name: name,
            price: price,
            image: image,
            effects: effects
        )
    }
}

extension ApiItem: Mappable {
    func mapping(map: Map) {
        name            <- map["name"]
        price           <- map["price"]
        image           <- map["image"]
        effects         <- map["effects"]
    }
}
