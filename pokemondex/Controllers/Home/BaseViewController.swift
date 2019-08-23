//
//  BaseViewController.swift
//  pokemondex
//
//  Created by MacMini2012 on 8/6/19.
//  Copyright © 2019 Pokemondex. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class BaseViewController: UITableViewController {
    
    var searchBar: UISearchController!
    var searchResults: [Any] = []
    private var previousRun = Date()
    private let minInterval = 0.05
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.definesPresentationContext = true
        setupSearchBar()
        
//        self.tableView.rowHeight = 72.0
    }
    
    private func setupSearchBar() {
        searchBar = UISearchController(searchResultsController: nil)
        searchBar.dimsBackgroundDuringPresentation = false
        searchBar.hidesNavigationBarDuringPresentation = false
    
        if let navigationBar = self.navigationController?.navigationBar {
    
            let gradient = CAGradientLayer()
            var bounds = navigationBar.bounds
            bounds.size.height += UIApplication.shared.statusBarFrame.size.height
            gradient.frame = bounds
            gradient.colors = [UIColor.init(hexString: "dee8fa").cgColor, UIColor.init(hexString: "d8f5da").cgColor]
            gradient.startPoint = CGPoint(x: 0, y: 0)
            gradient.endPoint = CGPoint(x: 1, y: 0)
    
            if let image = Utils.getImageFrom(gradientLayer: gradient) {
                navigationBar.barTintColor = UIColor(patternImage: image)
                if let tabBar = self.tabBarController?.tabBar {
                    tabBar.barTintColor = UIColor(patternImage: image)
                    tabBar.tintColor = .black
                }
            }
        }
        navigationItem.searchController = searchBar
        navigationItem.searchController?.searchBar.delegate = self
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
    
    func fetchResults(for text: String) {
    }
}

extension BaseViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if Date().timeIntervalSince(previousRun) > minInterval {
            previousRun = Date()
            fetchResults(for: searchBar.text ?? "")
        }
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        fetchResults(for: "")
    }
}
