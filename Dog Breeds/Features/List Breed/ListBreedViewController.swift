//
//  DogBreedsViewController.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 24-03-22.
//

import UIKit

protocol ListBreedDisplayLogic: AnyObject {
    func displayBreeds(viewModel: ListBreedViewModel)
    func displayBreedImages(breed: Breed)
}

class ListBreedViewController: UIViewController {
    private let presenter: ListBreedPresentationLogic
    private let dataSource: ListBreedDataSource
    private let delegate: ListBreedDelegate
    
    var breeds: [String] = []
    
    let tableView = UITableView()
    
    init(presenter: ListBreedPresentationLogic, dataSource: ListBreedDataSource, delegate: ListBreedDelegate) {
        self.presenter = presenter
        self.dataSource = dataSource
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attach(view: self)
        
        prepareTableView()
        fetchDogBreeds()
    }
    
    private func prepareTableView() {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        tableView.register(BreedViewCell.self, forCellReuseIdentifier: BreedViewCell.breedCellId)
        view.addAutoLayout(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        dataSource.view = self
        delegate.view = self
    }
    
    private func fetchDogBreeds() {
        presenter.presentDogBreeds()
    }
    
    internal func presentBreedImages(with breedName: String) {
        presenter.presentBreedImages(breedName: breedName)
    }
}

extension ListBreedViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let breedName = breeds[indexPath.row]
        presenter.presentBreedImages(breedName: breedName)
    }
}

extension ListBreedViewController: ListBreedDisplayLogic {
    func displayBreeds(viewModel: ListBreedViewModel) {
        DispatchQueue.main.async {
            self.breeds = viewModel.breed
            self.tableView.reloadData()
        }
    }
    
    func displayBreedImages(breed: Breed) {
        let vc = ViewControllerFactory.viewController(type: .breedImagelist, breedName: breed.name)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
