//
//  AlamofireMoveService.swift
//  pokemondex
//
//  Created by MacMini-PC on 14/08/2019.
//  Copyright © 2019 Pokemondex. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class AlamofireMoveService: AlamofireService, MoveService {
    
    func getMove(name: String, completion: @escaping MoveResult) {
        get(at: .move(name: name)).responseObject { (response: DataResponse<ApiMove>) in
            let result = response.result.value?.convert()
            completion(result, response.result.error)
        }
    }
    
    func getMoves(completion: @escaping MovesResult) {
        get(at: .moves).responseArray { (response: DataResponse<[ApiMove]>) in
            let result = response.result.value?.map { $0.convert() }
            completion(result ?? [], response.result.error)
        }
    }
    
    func searchMove(name: String, completion: @escaping MovesResult) {
        get(at: .searchMoves(name: name)).responseArray { (response: DataResponse<[ApiMove]>) in
            let result = response.result.value?.map { $0.convert() }
            completion(result ?? [], response.result.error)
        }
    }
    
}
