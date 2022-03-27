//
//  DogBreedsInteractor.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 25-03-22.
//

import Foundation

protocol DogBreedsBusinessLogic {
    func loadDogBreeds(request: DogBreeds.LoadDogBreeds.Request)
}

class DogBreedsInteractor: DogBreedsBusinessLogic {
    var presenter: DogBreedsPresentationLogic!
    var worker = DogBreedsWorker(urlString: "https://dog.ceo/api/breeds/list")
    
    func loadDogBreeds(request: DogBreeds.LoadDogBreeds.Request) {
        worker.fetchDogBreeds { [self] response in
            presenter.presentDogBreeds(response: response)
        }
    }
}
