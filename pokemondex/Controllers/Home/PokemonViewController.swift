//
//  FirstViewController.swift
//  pokemondex
//
//  Created by MacMini2012 on 8/1/19.
//  Copyright © 2019 Pokemondex. All rights reserved.
//

import UIKit

class PokemonViewController: BaseViewController {
    
    private var service: AlamofirePokemonService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let env = ApiEnvironment.production
        let context = NonPersistentApiContext(environment: env)
        service = AlamofirePokemonService(context: context)
       
        fetchResults(for: "")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath) as! PokemonTableViewCell
        
        let pokemon = searchResults[indexPath.row] as! Pokemon
        cell.pokemonNameLabel?.text = pokemon.name
        cell.pokemonIDLabel?.text = "#\(pokemon.id)"
        cell.pokemonImage?.af_setImage(withURL: URL(string: pokemon.image)!)
        cell.setPokemonTypesView(pokemonTypes: pokemon.pokemonTypes)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath) as! PokemonTableViewCell
        
        let pokemon = searchResults[indexPath.row] as! Pokemon
       
        let nextViewController = PokemonDetailViewController()
        self.present(nextViewController, animated:true, completion:nil)
    }

    override func fetchResults(for text: String) {
        searchResults.removeAll()
        service.searchPokemon(name: text, completion: { (results, error) in
            if let error = error {
                let alert = UIAlertController(title: "", message: "Can't connect to server. Please try again!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                
                self.present(alert, animated: true)
                
                return print(error.localizedDescription)
            }
            
            print("Found \(results.count) pokemons:")
            self.searchResults = results
            results.forEach { print("   \($0.name)") }
            self.tableView.reloadData()
        })
    }

}

