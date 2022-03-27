//
//  DogBreedsViewController.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 24-03-22.
//

import UIKit

protocol DogBreedsDisplayLogic: AnyObject {
    func displayBreeds(viewModel: DogBreeds.LoadDogBreeds.ViewModel)
}

class DogBreedsViewController: UIViewController {
    var interactor: DogBreedsBusinessLogic?
    var breeds: [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Dog Breeds"
        
        setupTableView()
        fetchDogBreeds()
    }
    
    func setupTableView() {
        tableView.register(BreedViewCell.nib(), forCellReuseIdentifier: BreedViewCell.breedCellId)
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    func fetchDogBreeds() {
        let request = DogBreeds.LoadDogBreeds.Request()
        interactor?.loadDogBreeds(request: request)
    }
    
}

extension DogBreedsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return breeds.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BreedViewCell.breedCellId, for: indexPath) as! BreedViewCell
        
        let breed = breeds[indexPath.row]
        cell.setup(with: breed)
        
        return cell
    }
    
}

extension DogBreedsViewController: DogBreedsDisplayLogic {
    func displayBreeds(viewModel: DogBreeds.LoadDogBreeds.ViewModel) {
        DispatchQueue.main.async {
            self.breeds = viewModel.breeds
            self.tableView.reloadData()
        }
    }
    
}
