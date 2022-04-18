//
//  DogBreedsInteractor.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 25-03-22.
//

import Foundation

protocol DogBreedsBusinessLogic {
    func loadDogBreeds(request: ListBreeds.LoadDogBreeds.Request)
    func goToBreedImages(request: ListBreeds.GoToImages.Request)
}

protocol DogBreedsDataStore {
    var breedName: String? { get set }
}

class DogBreedsInteractor: DogBreedsBusinessLogic, DogBreedsDataStore {
    var presenter: DogBreedsPresentationLogic!
    private let useCase: ListBreedUseCase
    
    var breedName: String?
    
    init(useCase: ListBreedUseCase) {
        self.useCase = useCase
    }
    
    func loadDogBreeds(request: ListBreeds.LoadDogBreeds.Request) {
        useCase.breeds { [self] response in
            presenter.presentDogBreeds(response: response)
        }
    }
    
    func goToBreedImages(request: ListBreeds.GoToImages.Request) {
        breedName = request.breedName
        presenter.presentBreedImages(response: ListBreeds.GoToImages.Response())
    }
}
