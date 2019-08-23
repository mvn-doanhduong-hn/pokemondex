//
//  StatsView.swift
//  pokemondex
//
//  Created by LTT on 8/23/19.
//  Copyright © 2019 Pokemondex. All rights reserved.
//

import UIKit

class StatsView: NibView {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    
    override func xibSetUp() {
        view = loadViewFromNib()
        view.frame = self.bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        
        addSubview(view)
    }
    
    func setData(name: String, value: Int, maxValue: Int) {
        nameLabel.text = name
        valueLabel.text = "\(value)"
        progressView.setProgress(Float(value/maxValue), animated: false)
    }

}
