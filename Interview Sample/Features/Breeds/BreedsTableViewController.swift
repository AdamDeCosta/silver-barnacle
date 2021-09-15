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
            self?.activityIndicator.stopAnimating()
        }
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
