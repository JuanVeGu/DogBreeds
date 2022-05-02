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
    var breedDetail: BreedDetail?
    
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
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.changePrefersLargeTitles(with: true)
        super.viewWillDisappear(animated)
    }
    
    private func prepareTableView() {
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.dataSource = dataSource
        tableView.delegate = delegate
        
        tableView.register(TitleViewCell.self, forCellReuseIdentifier: TitleViewCell.cellId)
        tableView.register(ImageViewCell.self, forCellReuseIdentifier: ImageViewCell.cellId)
        tableView.register(DescriptionViewCell.self, forCellReuseIdentifier: DescriptionViewCell.cellId)
        
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
