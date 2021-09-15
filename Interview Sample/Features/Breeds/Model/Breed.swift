//
//  Breed.swift
//  Interview Sample
//
//  Created by Adam DeCosta on 9/13/21.
//

import Foundation

struct Breed {
    let id: String
    
    let name: String
    
    let temperament: String
    
    let lifeSpan: String
    
    let origin: String
    
    let weight: String
    
    let countryCode: String
    
    let height: String
}

extension Breed: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case temperament
        case lifeSpan
        case origin
        case weight
        case countryCode
        case height
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.temperament = try container.decode(String.self, forKey: .temperament)
        self.lifeSpan = try container.decode(String.self, forKey: .lifeSpan)
        self.origin = try container.decode(String.self, forKey: .origin)
        self.countryCode = try container.decode(String.self, forKey: .countryCode)
        
        let weight = try container.decode(Measurement.self, forKey: .weight)
        self.weight = weight.imperial
        
        let height = try container.decode(Measurement.self, forKey: .weight) // BUG: Weight instead of height!
        self.height = height.imperial
    }
}
