//
//   BreedsTableViewController.swift
//  Interview Sample
//
//  Created by Adam DeCosta on 9/13/21.
//

import UIKit

class BreedsTableViewController: UITableViewController {
    
    let activityIndicator = UIActivityIndicatorView(style: .medium)
    let viewModel = BreedsViewModel()
    lazy var dataSource = BreedsDataSource(viewModel: viewModel)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
        
        self.setupLoadingView()
        
        viewModel.fetchBreeds { [weak self] _ in
            self?.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? BreedDetailViewController,
              let index = tableView.indexPathForSelectedRow?.row else {
            return
        }
        
        let breed = viewModel.breeds[index]
        vc.breed = breed
    }
}


// MARK: Utility
extension BreedsTableViewController {
    private func setupLoadingView() {
        self.tableView.backgroundView = activityIndicator
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
    }
}
