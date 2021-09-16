//
//  BreedsViewController.swift
//  Interview Sample
//
//  Created by Adam DeCosta on 9/16/21.
//

import UIKit

class BreedDetailViewController: UIViewController {
    
    @IBOutlet weak var breedName: UILabel!
    @IBOutlet weak var origin: UILabel!
    @IBOutlet weak var temperament: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var weight: UILabel!
    
    var breed: Breed?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let breed = breed else {
            return
        }
        
        self.breedName.text = breed.name
        self.origin.text = breed.origin
        self.temperament.text = breed.temperament
        self.height.text = "Height: \(breed.height)lbs"
        self.weight.text = "Weight: \(breed.weight)\""
    }
}
