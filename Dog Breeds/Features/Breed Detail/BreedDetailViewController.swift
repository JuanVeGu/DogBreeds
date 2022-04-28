//
//  BreedDetailViewController.swift
//  Dog Breeds
//
//  Created by mobdev on 26-04-22.
//

import UIKit

class BreedDetailViewController: UIViewController {
    private let dataSource: BreedDetailDataSource
    private let delegate: BreedDetailDelegate
    
    let tableView = UITableView()
    var breedDetailList: [BreedDetail] = []
    
    init(dataSource: BreedDetailDataSource, delegate: BreedDetailDelegate) {
        self.dataSource = dataSource
        self.delegate = delegate
        
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
        tableView.delegate = delegate
        tableView.register(BreedDetailViewCell.self, forCellReuseIdentifier: BreedDetailViewCell.cellId)
        
        dataSource.viewController = self
        delegate.viewController = self
        view.addAutoLayout(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

}
