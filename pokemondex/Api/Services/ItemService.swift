//
//  ItemService.swift
//  pokemondex
//
//  Created by MacMini-PC on 14/08/2019.
//  Copyright © 2019 Pokemondex. All rights reserved.
//

typealias ItemResult = (_ item: Item?, _ error: Error?) -> ()
typealias ItemsResult = (_ items: [Item], _ error: Error?) -> ()

protocol ItemService: class {
    
    func getItem(name: String, completion: @escaping ItemResult)
    
    func getItems(completion: @escaping ItemsResult)
    
    func searchItem(name: String, completion: @escaping ItemsResult)
    
}
