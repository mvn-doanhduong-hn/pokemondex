//
//  PokemonService.swift
//  pokemondex
//
//  Created by MacMini-PC on 14/08/2019.
//  Copyright © 2019 Pokemondex. All rights reserved.
//

typealias PokemonResult = (_ pokemon: Pokemon?, _ error: Error?) -> ()
typealias PokemonsResult = (_ pokemons: [Pokemon], _ error: Error?) -> ()
typealias PokemonDetailResult = (_ pokemonDetail: ApiPokemonDetail?, _ error: Error?) -> ()

protocol PokemonService: class {
    
    func getPokemon(id: String, completion: @escaping PokemonDetailResult)
    
    func getPokemons(completion: @escaping PokemonsResult)
    
    func searchPokemon(name: String, completion: @escaping PokemonsResult)
    
}
