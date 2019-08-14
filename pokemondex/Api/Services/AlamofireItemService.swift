//
//  AlamofireItemService.swift
//  pokemondex
//
//  Created by MacMini-PC on 14/08/2019.
//  Copyright © 2019 Pokemondex. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class AlamofireItemService: AlamofireService, ItemService {
    
    func getItem(name: String, completion: @escaping ItemResult) {
        get(at: .item(name: name)).responseObject { (response: DataResponse<ApiItem>) in
            let result = response.result.value?.convert()
            completion(result, response.result.error)
        }
    }
    
    func getItems(completion: @escaping ItemsResult) {
        get(at: .items).responseArray { (response: DataResponse<[ApiItem]>) in
            let result = response.result.value?.map { $0.convert() }
            completion(result ?? [], response.result.error)
        }
    }
    
    func searchItem(name: String, completion: @escaping ItemsResult) {
        get(at: .searchItems(name: name)).responseArray { (response: DataResponse<[ApiItem]>) in
            let result = response.result.value?.map { $0.convert() }
            completion(result ?? [], response.result.error)
        }
    }
    
}
