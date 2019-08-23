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
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        segmentedPager.segmentedControl.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor(hexString: "559EDF")]
        segmentedPager.segmentedControl.selectedTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.blue]
        segmentedPager.segmentedControl.selectionStyle = .arrow
        segmentedPager.segmentedControl.selectionIndicatorColor = .blue
        
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
        setDataEvolutionsPage()
        setDataMovesPage()
    }
    
    func setDataEvolutionsPage() {
//        let evolutionPage = viewPages[1] as! EvolutionsPageView
//
//        for subUIView in evolutionPage.stackView.arrangedSubviews as [UIView] {
//            subUIView.removeFromSuperview()
//        }
        
//        let view = EvolutionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 97))
//        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
//        view.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
//        evolutionPage.stackView.addArrangedSubview(view)
//        evolutionPage.stackView.addArrangedSubview(EvolutionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 97)))
//        evolutionPage.stackView.addArrangedSubview(EvolutionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 97)))
//        evolutionPage.stackView.addArrangedSubview(EvolutionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 97)))
//        evolutionPage.stackView.addArrangedSubview(EvolutionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 97)))
//        evolutionPage.stackView.addArrangedSubview(EvolutionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 97)))
//        print(evolutionPage.stackView.arrangedSubviews.count)
//        for item in viewPages {
////            let view =
////            view.frame = CGRect(x: 0, y: 0, width: (evolutionPage.frame.width), height: 96)
//            evolutionPage.stackView.addArrangedSubview(EvolutionView())
//            evolutionPage.stackView.addArrangedSubview(EvolutionView())
//        }
//        evolutionPage.stackView.distribution = .fillEqually
//        evolutionPage.stackView.translatesAutoresizingMaskIntoConstraints = false
//
//        print(evolutionPage.stackView.arrangedSubviews.count)
      
    }
    
    func setDataMovesPage() {
        
        var moves: [Move] = []
        moves.append(Move(name: "Bug", type: PokemonType.bug, effects: "This is a effects", power: 10, accuracy: "100", pp: 5))
        
         let movesPage = viewPages[2] as! MovesPageView
        movesPage.setData(moves)
    }
  
}
