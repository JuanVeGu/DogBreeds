//
//  DogBreedsViewController.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 24-03-22.
//

import UIKit

class DogBreedsViewController: UIViewController {
    var interactor: DogBreedsBusinessLogic?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func fetchDogBreeds() {
        let request = DogBreeds.LoadDogBreeds.Request()
        interactor?.loadDogBreeds(request: request)
    }
}

extension DogBreedsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
