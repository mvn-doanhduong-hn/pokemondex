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
    
//    @IBOutlet var headerView: UIView!
    let titles = ["Stats", "Evolutions", "Moves"]
    let images = [UIImage(named: "PageStatsSelected"), UIImage(named: "PageStatsSelected"), UIImage(named: "PageStatsSelected")]
    let selectedImages = [UIImage(named: "PageStatsSelected"), UIImage(named: "PageStatsSelected"), UIImage(named: "PageStatsSelected")]
    let viewPages = [StatsPageView(), EvolutionsPageView(), MovesPageView()]
    
    let pokemonHeaderView = PokemonHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingPagerView()
    }
    
    private func settingPagerView() {
        segmentedPager.backgroundColor = .white
        
        
        // Parallax Header
        segmentedPager.parallaxHeader.view = pokemonHeaderView
        segmentedPager.parallaxHeader.mode = .fill
        segmentedPager.parallaxHeader.height = pokemonHeaderView.bounds.height
        segmentedPager.parallaxHeader.minimumHeight = pokemonHeaderView.menuBarView.bounds.height
        
        // Segmented Control customization
        segmentedPager.segmentedControl.sectionTitles = titles
        segmentedPager.segmentedControl.sectionImages = images as [Any]
        segmentedPager.segmentedControl.sectionSelectedImages = selectedImages as [Any]
        segmentedPager.segmentedControl.selectionIndicatorLocation = .down
        segmentedPager.segmentedControl.backgroundColor = .white
        segmentedPager.segmentedControl.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.blue]
        segmentedPager.segmentedControl.selectedTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.orange]
        segmentedPager.segmentedControl.selectionStyle = .fullWidthStripe
        segmentedPager.segmentedControl.selectionIndicatorColor = .orange
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        segmentedPager.parallaxHeader.minimumHeight = pokemonHeaderView.menuBarView.bounds.height
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func setBackgroundColor() {
        let gradient = CAGradientLayer()
        var bounds = view.bounds
        bounds.size.height += UIApplication.shared.statusBarFrame.size.height
        gradient.frame = bounds
        gradient.colors = [UIColor.init(hexString: "559EDF").cgColor, UIColor.init(hexString: "69B9E3").cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        
        if let image = Utils.getImageFrom(gradientLayer: gradient) {
            view.backgroundColor = UIColor(patternImage: image)
        }
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
    
    // Asks the data source for a view to insert in a particular page of the pager.
    override func segmentedPager(_ segmentedPager: MXSegmentedPager, viewForPageAt index: Int) -> UIView {
        return viewPages[index];
    }
    
    override func segmentedPager(_ segmentedPager: MXSegmentedPager, didScrollWith parallaxHeader: MXParallaxHeader) {
//        print("progress \(parallaxHeader.progress)")
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
    
  
}
