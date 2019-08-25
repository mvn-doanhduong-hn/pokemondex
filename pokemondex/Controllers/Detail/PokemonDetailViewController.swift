//
//  PokemonDetailViewController.swift
//  pokemondex
//
//  Created by MacMini2012 on 8/7/19.
//  Copyright © 2019 Pokemondex. All rights reserved.
//

import UIKit
import MXSegmentedPager

class PokemonDetailViewController: MXSegmentedPagerController {
    
    let titles = ["Stats", "Evolutions", "Moves"]
    let images = [UIImage(named: "PageStatsSelected"), UIImage(named: "PageStatsSelected"), UIImage(named: "PageStatsSelected")]
    let selectedImages = [UIImage(named: "PageStatsSelected"), UIImage(named: "PageStatsSelected"), UIImage(named: "PageStatsSelected")]
    let viewPages = [StatsPageView(), EvolutionsPageView(), MovesPageView()]
    
    let pokemonHeaderView = PokemonHeaderView()
    
    private var service: AlamofirePokemonService!
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let env = ApiEnvironment.production
        let context = NonPersistentApiContext(environment: env)
        service = AlamofirePokemonService(context: context)
        
        settingPagerView()
        fetchData()
    }
    
    private func settingPagerView() {
        segmentedPager.backgroundColor = .white
        
        // Parallax Headerok
        segmentedPager.parallaxHeader.view = pokemonHeaderView
        pokemonHeaderView.backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        segmentedPager.parallaxHeader.mode = .fill
        segmentedPager.parallaxHeader.height = pokemonHeaderView.bounds.height
        segmentedPager.parallaxHeader.minimumHeight = pokemonHeaderView.menuBarView.bounds.height
        
        // Segmented Control customization
        
        segmentedPager.segmentedControl.type = .text
        segmentedPager.segmentedControl.sectionTitles = titles
        segmentedPager.segmentedControl.sectionImages = images as [Any]
        segmentedPager.segmentedControl.sectionSelectedImages = selectedImages as [Any]
        
        segmentedPager.segmentedControl.selectionIndicatorLocation = .down
        segmentedPager.segmentedControl.backgroundColor = .white
        segmentedPager.segmentedControl.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.darkGray]
        segmentedPager.segmentedControl.selectedTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor(hexString: "1C8BED")]
        segmentedPager.segmentedControl.selectionStyle = .arrow
        segmentedPager.segmentedControl.selectionIndicatorColor = UIColor(hexString: "1C8BED")        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        segmentedPager.parallaxHeader.minimumHeight = pokemonHeaderView.menuBarView.bounds.height
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Asks the data source to return the number of pages in the segmented pager.
    override func numberOfPages(in segmentedPager: MXSegmentedPager) -> Int {
        return titles.count
    }
    
    override func segmentedPager(_ segmentedPager: MXSegmentedPager, titleForSectionAt index: Int) -> String {
        return ["STATS", "EVOLUTIONS", "MOVES"][index]
    }

    override func segmentedPager(_ segmentedPager: MXSegmentedPager, imageForSectionAt index: Int) -> UIImage {
        return images[index]!
    }
    
    override func segmentedPager(_ segmentedPager: MXSegmentedPager, selectedImageForSectionAt index: Int) -> UIImage {
        return selectedImages[index]!
    }
    
    // Asks the data source for a view to insert in a particular page of the pager.
    override func segmentedPager(_ segmentedPager: MXSegmentedPager, viewForPageAt index: Int) -> UIView {
        return viewPages[index]
    }
    
    override func segmentedPager(_ segmentedPager: MXSegmentedPager, didScrollWith parallaxHeader: MXParallaxHeader) {
        pokemonHeaderView.fadeInTitleBar()
        if (parallaxHeader.progress <= 0.3) {
            if (pokemonHeaderView.isTitleBarHidden()) {
                pokemonHeaderView.fadeInTitleBar()
            }
        } else {
            if (!pokemonHeaderView.isTitleBarHidden()) {
                pokemonHeaderView.fadeOutTitleBar()                
            }
        }
    }
  
    @objc func backAction(sender: UIButton!) {
        self.dismiss(animated: true, completion: {})
    }
    
    func fetchData() {
        service.getPokemon(id: self.pokemon.id, completion: { (pokemon, error) in
            if let error = error {
                return print(error.localizedDescription)
            }
            
//            let evolutionPage = self.viewPages[1] as! EvolutionsPageView
//            evolutionPage.setData(evolutions)
            
        })
        
        setDataEvolutionsPage()
        setDataMovesPage()
    }
    
    func setDataEvolutionsPage() {
        var evolutions: [Evolution] = []
        evolutions.append(Evolution(pokemonImage: "https://img.pokemondb.net/sprites/omega-ruby-alpha-sapphire/dex/normal/charmander.png", pokemonName: "Charmander", evolutionPokemonImage: "https://img.pokemondb.net/sprites/omega-ruby-alpha-sapphire/dex/normal/charmeleon.png", evolutionPokemonName: "Charmeleon", evolutionLevel: 16))
        evolutions.append(Evolution(pokemonImage: "https://img.pokemondb.net/sprites/omega-ruby-alpha-sapphire/dex/normal/charmeleon.png", pokemonName: "Charmeleon", evolutionPokemonImage: "https://img.pokemondb.net/sprites/omega-ruby-alpha-sapphire/dex/normal/charizard.png", evolutionPokemonName: "Charizard", evolutionLevel: 36))
       
        let evolutionPage = viewPages[1] as! EvolutionsPageView
        evolutionPage.setData(evolutions)
    }
    
    func setDataMovesPage() {
        
        var moves: [Move] = []
        moves.append(Move(name: "Bug", type: PokemonType.bug, effects: "This is a effects", power: 10, accuracy: 100, pp: 5))
        
         let movesPage = viewPages[2] as! MovesPageView
        movesPage.setData(moves)
    }
  
}
