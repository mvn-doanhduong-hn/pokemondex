//
//  BaseViewController.swift
//  pokemondex
//
//  Created by MacMini2012 on 8/6/19.
//  Copyright © 2019 Pokemondex. All rights reserved.
//

import UIKit

class BaseViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchBar = UISearchController(searchResultsController: nil)
        if let navigationBar = self.navigationController?.navigationBar {
            
            let gradient = CAGradientLayer()
            var bounds = navigationBar.bounds
            bounds.size.height += UIApplication.shared.statusBarFrame.size.height
            gradient.frame = bounds
            gradient.colors = [UIColor.init(hexString: "dee8fa").cgColor, UIColor.init(hexString: "d8f5da").cgColor]
            gradient.startPoint = CGPoint(x: 0, y: 0)
            gradient.endPoint = CGPoint(x: 1, y: 0)
            
            if let image = getImageFrom(gradientLayer: gradient) {
                navigationBar.barTintColor = UIColor(patternImage: image)
                if let tabBar = self.tabBarController?.tabBar {
                    tabBar.barTintColor = UIColor(patternImage: image)
                    tabBar.tintColor = .black
                }
            }
        }
        navigationItem.searchController = searchBar
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if #available(iOS 11.0, *) {
            navigationItem.hidesSearchBarWhenScrolling = false
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if #available(iOS 11.0, *) {
            navigationItem.hidesSearchBarWhenScrolling = true
        }
    }
    
    func getImageFrom(gradientLayer:CAGradientLayer) -> UIImage? {
        var gradientImage:UIImage?
        UIGraphicsBeginImageContext(gradientLayer.frame.size)
        if let context = UIGraphicsGetCurrentContext() {
            gradientLayer.render(in: context)
            gradientImage = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch)
        }
        UIGraphicsEndImageContext()
        return gradientImage
    }
    
    
}
