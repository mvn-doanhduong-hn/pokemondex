//
//  Configs.swift
//  pokemondex
//
//  Created by MacMini2012 on 8/14/19.
//  Copyright © 2019 Pokemondex. All rights reserved.
//

import Foundation

enum ApiEnvironment: String { case
    
    production = "http://192.168.1.57:8080/"
    
    var url: String {
        return rawValue
    }
}
