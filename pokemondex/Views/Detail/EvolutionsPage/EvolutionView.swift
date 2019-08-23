//
//  EvolutionView.swift
//  pokemondex
//
//  Created by LTT on 8/22/19.
//  Copyright © 2019 Pokemondex. All rights reserved.
//

import UIKit

class EvolutionView: NibView {

    override func xibSetUp() {
        view = loadViewFromNib()
        view.frame = self.bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        
        addSubview(view)
    }

}
