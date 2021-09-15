//
//  BreedsNetworkController.swift
//  Interview Sample
//
//  Created by Adam DeCosta on 9/13/21.
//

import Foundation

protocol BreedsNetworkControllerProtocol {
    func getBreeds(completion: (([Breed]) -> Void)?)
}

struct BreedsNetworkController: BreedsNetworkControllerProtocol {
    func getBreeds(completion: (([Breed]) -> Void)? = nil) {
        guard let url = URL(string: "https://decosta.io") else {
            assertionFailure("Unable to create URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else {
                completion?([])
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            guard let breeds = try? decoder.decode([Breed].self, from: data) else {
                completion?([])
                return
            }
            
            completion?(breeds)
        }
    }
}
