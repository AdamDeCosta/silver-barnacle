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

fileprivate let BREEDS_ENDPOINT = "https://api.thedogapi.com/v1/breeds"

struct BreedsNetworkController: BreedsNetworkControllerProtocol {
    func getBreeds(completion: (([Breed]) -> Void)? = nil) {
        guard let url = URL(string: BREEDS_ENDPOINT) else {
            assertionFailure("Unable to create URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                guard error == nil, let data = data else {
                    completion?([])
                    return
                }
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .useDefaultKeys
                
                do {
                    let breeds = try decoder.decode([Breed].self, from: data)
                    completion?(breeds)
                } catch {
                    print("Error: \(error)")
                    completion?([])
                }
            }
        }.resume()
    }
}
