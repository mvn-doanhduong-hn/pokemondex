//
//  StatsPageView.swift
//  pokemondex
//
//  Created by MacMini2012 on 8/8/19.
//  Copyright © 2019 Pokemondex. All rights reserved.
//

import UIKit

class StatsPageView: NibView {

    @IBOutlet weak var statsStackView: UIStackView!
    
    override func xibSetUp() {
        view = loadViewFromNib()
        view.frame = self.bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        
        addSubview(view)
        
        setDataBaseStats()
    }
    
    func setDataBaseStats() {
        for subUIView in statsStackView.arrangedSubviews {
            subUIView.removeFromSuperview()
        }
        
        let hpView = StatsView()
        hpView.setData(name: "HP", value: 45, maxValue: 200)
        statsStackView.addArrangedSubview(hpView)
        
        let atkView = StatsView()
        atkView.setData(name: "ATK", value: 50, maxValue: 200)
        statsStackView.addArrangedSubview(atkView)
        
        let defView = StatsView()
        defView.setData(name: "DEF", value: 45, maxValue: 200)
        statsStackView.addArrangedSubview(defView)
        
        let sAtkView = StatsView()
        sAtkView.setData(name: "S.ATK", value: 45, maxValue: 200)
        statsStackView.addArrangedSubview(sAtkView)
        
        let sDefView = StatsView()
        sDefView.setData(name: "S.DEF", value: 45, maxValue: 200)
        statsStackView.addArrangedSubview(sDefView)
        
        let speedView = StatsView()
        speedView.setData(name: "SPD", value: 45, maxValue: 200)
        statsStackView.addArrangedSubview(speedView)
        
        print(statsStackView.arrangedSubviews.count)
    }
}

