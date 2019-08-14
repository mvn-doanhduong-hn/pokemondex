//
//  PokemonHeaderView.swift
//  pokemondex
//
//  Created by MacMini2012 on 8/7/19.
//  Copyright © 2019 Pokemondex. All rights reserved.
//

import UIKit

class PokemonHeaderView: NibView {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var roundCornerView: UIView!
    @IBOutlet weak var menuBarView: UIView!
    @IBOutlet weak var pokemonMenuLabel: UILabel!
    
    convenience init() {
        self.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 440))
    }
    
    override func xibSetUp() {
        view = loadViewFromNib()
        view.frame = self.bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        setBackgroundColor()
        setRoundCornerView()
        
        addSubview(view)
    }
    
    func setBackgroundColor() {
        let gradient = CAGradientLayer()
        var bounds = contentView.bounds
        bounds.size.height += UIApplication.shared.statusBarFrame.size.height
        gradient.frame = bounds
        gradient.colors = [UIColor.init(hexString: "559EDF").cgColor, UIColor.init(hexString: "69B9E3").cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        
        if let image = Utils.getImageFrom(gradientLayer: gradient) {
            contentView.backgroundColor = UIColor(patternImage: image)
        }
    }
    
    func setRoundCornerView() {
        roundCornerView.roundCorners(corners: [.topLeft, .topRight], radius: 48)
    }
    
    func isTitleBarHidden() -> Bool {
        return self.pokemonMenuLabel.isHidden
    }
    
    /// Fade in a view with a duration
    ///
    /// Parameter duration: custom animation duration
    func fadeInTitleBar(withDuration duration: TimeInterval = 0.5) {
        UIView.animate(withDuration: duration, animations: {
            self.pokemonMenuLabel.alpha = 1.0
            self.pokemonMenuLabel.isHidden = false
        })
    }
    
    /// Fade out a view with a duration
    ///
    /// - Parameter duration: custom animation duration
    func fadeOutTitleBar(withDuration duration: TimeInterval = 0.5) {
        UIView.animate(withDuration: duration, animations: {
            self.pokemonMenuLabel.alpha = 0.0
             self.pokemonMenuLabel.isHidden = true
        })
    }
}
