//
//  MoveService.swift
//  pokemondex
//
//  Created by MacMini-PC on 14/08/2019.
//  Copyright © 2019 Pokemondex. All rights reserved.
//

typealias MoveResult = (_ move: Move?, _ error: Error?) -> ()
typealias MovesResult = (_ moves: [Move], _ error: Error?) -> ()

protocol MoveService: class {
    
    func getMove(name: String, completion: @escaping MoveResult)
    
    func getMoves(completion: @escaping MovesResult)
    
    func searchMove(name: String, completion: @escaping MovesResult)
    
}
