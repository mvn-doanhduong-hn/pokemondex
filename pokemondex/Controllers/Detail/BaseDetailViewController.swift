//
//  BaseDetailViewController.swift
//  pokemondex
//
//  Created by LTT on 8/21/19.
//  Copyright © 2019 Pokemondex. All rights reserved.
//

import UIKit

class BaseDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func setBackgroundColor(fromHexString fromColor: String, toHexString toColor: String) {
        let gradient = CAGradientLayer()
        var bounds = view.bounds
        bounds.size.height += UIApplication.shared.statusBarFrame.size.height
        gradient.frame = bounds
        gradient.colors = [UIColor.init(hexString: fromColor).cgColor, UIColor.init(hexString: toColor).cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        
        if let image = Utils.getImageFrom(gradientLayer: gradient) {
            view.backgroundColor = UIColor(patternImage: image)
        }
    }
    
    func setBackgroundColor(fromColor: UIColor, toColor: UIColor) {
        let gradient = CAGradientLayer()
        var bounds = view.bounds
        bounds.size.height += UIApplication.shared.statusBarFrame.size.height
        gradient.frame = bounds
        gradient.colors = [fromColor.cgColor, toColor.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        
        if let image = Utils.getImageFrom(gradientLayer: gradient) {
            view.backgroundColor = UIColor(patternImage: image)
        }
    }
    
    func setRoundCornerView(_ view: UIView) {
        view.roundCorners(corners: [.topLeft, .topRight], radius: 48)
    }

}
