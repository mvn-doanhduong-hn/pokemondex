//
//  FirstViewController.swift
//  pokemondex
//
//  Created by MacMini2012 on 8/1/19.
//  Copyright © 2019 Pokemondex. All rights reserved.
//

import UIKit

class PokemonViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let env = ApiEnvironment.production
        let context = NonPersistentApiContext(environment: env)
        let service = AlamofirePokemonService(context: context)
        service.getPokemons { (pokemons, error) in
            if let error = error {
                return print(error.localizedDescription)
            }
            print("Found \(pokemons.count) pokemons:")
            pokemons.forEach { print("   \($0.name)") }
        }
       
    }

    

}

