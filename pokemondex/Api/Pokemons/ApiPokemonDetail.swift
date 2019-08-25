//
//  ApiPokemonDetail.swift
//  pokemondex
//
//  Created by LTT on 8/25/19.
//  Copyright © 2019 Pokemondex. All rights reserved.
//

import ObjectMapper

class ApiPokemonDetail: Mappable {
    
    var pokemon: Pokemon?
    var stats: Stats?
    var evolutions: [Evolution]?
    var moves: [Move]?
    
    required public init?(map: Map) {
        
    }
    
    func convert() -> PokemonDetail {
        return PokemonDetail(
            pokemon: pokemon!,
            stats: stats!,
            evolutions: evolutions!,
            moves: moves!
        )
    }
    
    func mapping(map: Map) {
        pokemon         <- map["pokemon"]
        stats           <- map["stats"]
        evolutions      <- map["evolutions"]
        moves           <- map["moves"]
    }
}

class StatsResponse: Mappable {
    
    var basicStatses = [BasicStats]()
    var weaknesses = [Weakness]()
    var breeding = Breeding(eggGroups: [], hatchTime: HatchTime(steps: 0, cycles: 0), femaleGender: 0)
    
    
    required public init?(map: Map) {
        
    }
    
    func convert() -> Stats {
        return Stats(basicStatses: basicStatses, weaknesses: weaknesses, breeding: breeding)
    }
    
    func mapping(map: Map) {
        basicStatses         <- map["basicStatses"]
        weaknesses           <- map["weaknesses"]
        breeding             <- map["breeding"]
    }
}

class BasicStatsResponse: Mappable {
    
    var name = ""
    var value = 0
    var maxValue = 0
    
    required public init?(map: Map) {
        
    }
    
    func convert() -> BasicStats {
        return BasicStats(name: name, value: value, maxValue: maxValue)
    }
    
    func mapping(map: Map) {
        name         <- map["name"]
        value        <- map["value"]
        maxValue     <- map["maxValue"]
    }
}

class WeaknessResponse: Mappable {
    
    var type = ""
    var effect = Float(0)
    
    required public init?(map: Map) {
        
    }
    
    func convert() -> Weakness {
        return Weakness(type: PokemonType(rawValue: type) ?? PokemonType.normal, effect: effect)
    }
    
    func mapping(map: Map) {
        type         <- map["pokemonType"]
        effect       <- map["effect"]
    }
}

class BreedingResponse: Mappable {
    
    var eggGroups: [String] = []
    var hatchTime = HatchTime(steps: 0, cycles: 0)
    var femaleGender = Float(0)
    
    required public init?(map: Map) {
        
    }
    
    func convert() -> Breeding {
        return Breeding(eggGroups: eggGroups, hatchTime: hatchTime, femaleGender: femaleGender)
    }
    
    func mapping(map: Map) {
        eggGroups           <- map["eggGroups"]
        hatchTime           <- map["hatchTime"]
        femaleGender        <- map["femaleGender"]
    }
}

class HatchTimeResponse: Mappable {
    
    var steps = 0
    var cycles = 0
    
    required public init?(map: Map) {
        
    }
    
    func convert() -> HatchTime {
        return HatchTime(steps: steps, cycles: cycles)
    }
    
    func mapping(map: Map) {
        steps           <- map["steps"]
        cycles          <- map["cycles"]
    }
}

class EvolutionResponse: Mappable {
    
    var pokemonImage = ""
    var pokemonName = ""
    var evolutionPokemonImage = ""
    var evolutionPokemonName = ""
    var evolutionLevel = 0
    
    required public init?(map: Map) {
        
    }
    
    func convert() -> Evolution {
        return Evolution(pokemonImage: pokemonImage, pokemonName: pokemonName, evolutionPokemonImage: evolutionPokemonImage, evolutionPokemonName: evolutionPokemonName, evolutionLevel: evolutionLevel)
    }
    
    func mapping(map: Map) {
        pokemonImage                <- map["pokemonImage"]
        pokemonName                 <- map["pokemonName"]
        evolutionPokemonImage       <- map["evolutionPokemonImage"]
        evolutionPokemonName        <- map["evolutionPokemonName"]
        evolutionLevel              <- map["evolutionLevel"]
    }
}

class PokemonMoveResponse: Mappable {
    
    var name = ""
    var type = ""
    var level = 0
    
    required public init?(map: Map) {
        
    }
    
    func convert() -> PokemonMove {
        return PokemonMove(name: name, type: PokemonType(rawValue: type)!, level: level)
    }
    
    func mapping(map: Map) {
        name            <- map["name"]
        level           <- map["level"]
        type            <- map["type"]
    }
}
