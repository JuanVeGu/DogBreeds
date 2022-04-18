//
//  DogBreedsViewController.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 24-03-22.
//

import UIKit

protocol ListBreedDisplayLogic: AnyObject {
    func displayBreeds(viewModel: ListBreeds.LoadDogBreeds.ViewModel)
    func displayBreedImages(viewModel: ListBreeds.GoToImages.ViewModel)
}

class ListBreedViewController: UIViewController {
    private let interactor: ListBreedBusinessLogic
    let router: (NSObjectProtocol & ListBreedRoutingLogic & ListBreedDataPassing)
    
    var breeds: [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    init(interactor: ListBreedBusinessLogic, router: (NSObjectProtocol & ListBreedRoutingLogic & ListBreedDataPassing)) {
        self.interactor = interactor
        self.router = router
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.attach(view: self)
        
        setupTableView()
        fetchDogBreeds()
    }
    
    func setupTableView() {
        tableView.register(BreedViewCell.nib(), forCellReuseIdentifier: BreedViewCell.breedCellId)
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    func fetchDogBreeds() {
        let request = ListBreeds.LoadDogBreeds.Request()
        interactor.loadDogBreeds(request: request)
    }
}

extension ListBreedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return breeds.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BreedViewCell.breedCellId, for: indexPath) as! BreedViewCell
        
        let breed = breeds[indexPath.row]
        cell.setup(with: breed)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let breedName = breeds[indexPath.row]
        interactor.goToBreedImages(request: ListBreeds.GoToImages.Request(breedName: breedName))
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ListBreedViewController: ListBreedDisplayLogic {
    func displayBreeds(viewModel: ListBreeds.LoadDogBreeds.ViewModel) {
        DispatchQueue.main.async {
            self.breeds = viewModel.breeds
            self.tableView.reloadData()
        }
    }
    
    func displayBreedImages(viewModel: ListBreeds.GoToImages.ViewModel) {
        router.routeToBreedImages()
    }
    
}