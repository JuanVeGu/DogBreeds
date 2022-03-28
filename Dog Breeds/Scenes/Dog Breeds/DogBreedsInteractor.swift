//
//  DogBreedsInteractor.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 25-03-22.
//

import Foundation

protocol DogBreedsBusinessLogic {
    func loadDogBreeds(request: DogBreeds.LoadDogBreeds.Request)
    func goToBreedImages(request: DogBreeds.GoToImages.Request)
}

protocol DogBreedsDataStore {
    var breedName: String? { get set }
}

class DogBreedsInteractor: DogBreedsBusinessLogic, DogBreedsDataStore {
    var presenter: DogBreedsPresentationLogic!
    var worker = DogBreedsWorker()
    
    var breedName: String?
    
    func loadDogBreeds(request: DogBreeds.LoadDogBreeds.Request) {
        worker.fetchDogBreeds { [self] response in
            presenter.presentDogBreeds(response: response)
        }
    }
    
    func goToBreedImages(request: DogBreeds.GoToImages.Request) {
        breedName = request.breedName
        presenter.presentBreedImages(response: DogBreeds.GoToImages.Response())
    }
}
