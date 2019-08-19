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
            self.searchResults = pokemons
            pokemons.forEach { print("   \($0.name)") }
            self.tableView.reloadData()
        }
       
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath) as! PokemonTableViewCell
        
        let pokemon = searchResults[indexPath.row] as! Pokemon
        cell.pokemonNameLabel?.text = pokemon.name
        cell.pokemonIDLabel?.text = pokemon.id
        cell.pokemonImage?.af_setImage(withURL: URL(string: pokemon.image)!)
        
        return cell
    }

    override func fetchResults(for text: String) {
        let env = ApiEnvironment.production
        let context = NonPersistentApiContext(environment: env)
        let service = AlamofirePokemonService(context: context)
        service.searchPokemon(name: text, completion: { (pokemons, error) in
            if let error = error {
                return print(error.localizedDescription)
            }
            
            print("Found \(pokemons.count) pokemons:")
            self.searchResults = pokemons
            pokemons.forEach { print("   \($0.name)") }
            self.tableView.reloadData()
        })
    }

}

