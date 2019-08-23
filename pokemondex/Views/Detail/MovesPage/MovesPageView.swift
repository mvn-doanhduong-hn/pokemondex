//
//  MovesPageView.swift
//  pokemondex
//
//  Created by MacMini2012 on 8/8/19.
//  Copyright © 2019 Pokemondex. All rights reserved.
//

import UIKit

class MovesPageView: NibView {
    
    @IBOutlet weak var tableView: UITableView!
    
    var moves: [Move] = [Move(name: "Bug", type: PokemonType.bug, effects: "This is a effects", power: 10, accuracy: "100", pp: 5)]
    
    override func xibSetUp() {
        view = loadViewFromNib()
        view.frame = self.bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        
        addSubview(view)
        
        registerTableCell()
    }
    
    func registerTableCell() {
        let nib = UINib.init(nibName: "MovePageTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "MovePageTableViewCell")
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func setData(_ moves: [Move]) {
        self.moves = moves
        self.tableView.reloadData()
    }
}

extension MovesPageView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moves.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovePageTableViewCell", for: indexPath) as! MovePageTableViewCell
        
        let move = moves[indexPath.row]
        cell.nameLabel.text = move.name
        cell.levelLabel.text = "Level 1"
        
        return cell
    }
    
    
}
