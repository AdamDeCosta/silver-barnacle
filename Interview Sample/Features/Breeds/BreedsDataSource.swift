//
//  BreedsDataSource.swift
//  Interview Sample
//
//  Created by Adam DeCosta on 9/15/21.
//

import UIKit

class BreedsDataSource: NSObject, UITableViewDataSource {
    let viewModel: BreedsViewModel
    
    init(viewModel: BreedsViewModel) {
        self.viewModel = viewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.breeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "breedsCell") else {
            assertionFailure("Unable to dequeue Cell")
            return UITableViewCell()
        }
        
        cell.textLabel?.text = self.viewModel.breeds[indexPath.row].name
        return cell
    }
}
