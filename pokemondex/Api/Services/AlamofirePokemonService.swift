//
//  AlamofirePokemonService.swift
//  pokemondex
//
//  Created by MacMini-PC on 14/08/2019.
//  Copyright © 2019 Pokemondex. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class AlamofirePokemonService: AlamofireService, PokemonService {
    
    func getPokemon(id: String, completion: @escaping PokemonResult) {
        get(at: .pokemon(id: id)).responseObject { (response: DataResponse<ApiPokemon>) in
            let result = response.result.value?.convert()
            completion(result, response.result.error)
        }
    }
    
    func getPokemons(completion: @escaping PokemonsResult) {
        get(at: .pokemons).responseArray { (response: DataResponse<[ApiPokemon]>) in
            let result = response.result.value?.map { $0.convert() }
            completion(result ?? [], response.result.error)
        }
    }
    
    func searchPokemon(name: String, completion: @escaping PokemonsResult) {
        get(at: .searchPokemons(name: name)).responseArray { (response: DataResponse<[ApiPokemon]>) in
            let result = response.result.value?.map { $0.convert() }
            completion(result ?? [], response.result.error)
        }
    }
    
}
