//
//  StatsPageView.swift
//  pokemondex
//
//  Created by MacMini2012 on 8/8/19.
//  Copyright © 2019 Pokemondex. All rights reserved.
//

import UIKit

class StatsPageView: NibView {
  
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var basicStatsView: BasicStatsView!
    @IBOutlet weak var weaknessesView: WeaknessesView!
    @IBOutlet weak var breedingView: BreedingView!
    
    override func xibSetUp() {
        view = loadViewFromNib()
        view.frame = self.bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        
        setupView()
        
        
        addSubview(view)        
    }
    
    func setupView() {
        setDataBaseStats()
        setDataWeaknesses()
        setDataBreeding()
        
        scrollView.updateContentView()
    }
    
    func setDataBaseStats() {
        var basicStatses: [BasicStats] = []
        basicStatses.append(BasicStats(name: "HP", value: 175, maxValue: 200))
        basicStatses.append(BasicStats(name: "ATK", value: 40, maxValue: 200))
        basicStatses.append(BasicStats(name: "DEF", value: 40, maxValue: 200))
        basicStatses.append(BasicStats(name: "S.ATK", value: 40, maxValue: 200))
        basicStatses.append(BasicStats(name: "S.DEF", value: 40, maxValue: 200))
        basicStatses.append(BasicStats(name: "SPD", value: 40, maxValue: 200))
        
        basicStatsView.setData(basicStatses)
    }
    
    func setDataWeaknesses() {
        var weaknesses: [Weakness] = []
        for _ in 1...18 {
            weaknesses.append(Weakness(type: .water, effect: 2))
        }
        weaknessesView.setData(weaknesses)
    }
    
    func setDataBreeding() {
        let breeding = Breeding(eggGroups: ["Master", "Evil"], hatchTime: HatchTime(steps: 5100, cycles: 30), femaleGender: 36.9)
        breedingView.setData(breeding: breeding)
    }
}

