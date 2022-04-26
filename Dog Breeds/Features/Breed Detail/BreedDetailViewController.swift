//
//  BreedDetailViewController.swift
//  Dog Breeds
//
//  Created by mobdev on 26-04-22.
//

import UIKit

class BreedDetailViewController: UIViewController {
    private let dataSource: BreedDetailDataSource
    
    let tableView = UITableView()
    
    init(dataSource: BreedDetailDataSource) {
        self.dataSource = dataSource
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
    }
    
    private func prepareTableView() {
        tableView.dataSource = dataSource
        dataSource.viewController = self
        tableView.register(BreedDetailViewCell.self, forCellReuseIdentifier: BreedDetailViewCell.cellId)
        view.addAutoLayout(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

}
