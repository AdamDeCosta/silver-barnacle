//
//  Breed.swift
//  Interview Sample
//
//  Created by Adam DeCosta on 9/13/21.
//

import Foundation

struct Breed {
    let id: Int
    
    let name: String
    
    let temperament: String?
    
    let lifeSpan: String
    
    let origin: String?
    
    let weight: String
    
    let height: String
}

extension Breed: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case temperament
        case lifeSpan // endpoint sends as life_span
        case origin
        case weight
        case height
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.temperament = try container.decodeIfPresent(String.self, forKey: .temperament)
        self.lifeSpan = try container.decode(String.self, forKey: .lifeSpan)
        self.origin = try container.decodeIfPresent(String.self, forKey: .origin)
        
        let weight = try container.decode(Measurement.self, forKey: .weight)
        self.weight = weight.imperial
        
        let height = try container.decode(Measurement.self, forKey: .weight)
        self.height = height.metric
    }
}
