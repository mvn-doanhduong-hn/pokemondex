//
//  MovesViewController.swift
//  pokemondex
//
//  Created by MacMini2012 on 8/1/19.
//  Copyright © 2019 Pokemondex. All rights reserved.
//

import UIKit

class MovesViewController: BaseViewController {

    private var service: AlamofireMoveService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let env = ApiEnvironment.production
        let context = NonPersistentApiContext(environment: env)
        service = AlamofireMoveService(context: context)
        
        fetchResults(for: "")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moveCell", for: indexPath) as! MoveTableViewCell
        
        let move = searchResults[indexPath.row] as! Move
        cell.nameLabel?.text = move.name
        cell.setPokemonTypeView(pokemonType: move.type)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let detailViewController = storyBoard.instantiateViewController(withIdentifier: "moveDetailViewController") as! MoveDetailViewController
        self.present(detailViewController, animated: true, completion: nil)
    }
    
    override func fetchResults(for text: String) {
        searchResults.removeAll()
        service.searchMove(name: text, completion: { (results, error) in
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

