//
//  Configs.swift
//  pokemondex
//
//  Created by MacMini2012 on 8/14/19.
//  Copyright © 2019 Pokemondex. All rights reserved.
//

import Foundation

enum ApiEnvironment: String { case
    
    production = "http://localhost:8080/"
    
    var url: String {
        return rawValue
    }
}
