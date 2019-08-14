//
//  NonPersistentApiContext.swift
//  pokemondex
//
//  Created by MacMini2012 on 8/14/19.
//  Copyright © 2019 Pokemondex. All rights reserved.
//

import Foundation

class NonPersistentApiContext: ApiContext {
    
    init(environment: ApiEnvironment) {
        self.environment = environment
    }
    
    var environment: ApiEnvironment
}
