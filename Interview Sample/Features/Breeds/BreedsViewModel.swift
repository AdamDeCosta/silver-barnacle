//
//  BreedsViewModel.swift
//  Interview Sample
//
//  Created by Adam DeCosta on 9/13/21.
//

import Foundation

class BreedsViewModel {
    private let networkController: BreedsNetworkControllerProtocol
    
    private(set) var breeds: [Breed] = []
    
    init(networkController controller: BreedsNetworkControllerProtocol = BreedsNetworkController()) {
        self.networkController = controller
    }
    
    func fetchBreeds(completion: (([Breed]) -> Void)? = nil) {
        networkController.getBreeds { [weak self] breeds in
            self?.breeds = breeds
        }
    }
}
