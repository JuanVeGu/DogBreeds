//
//  DogBreedsInteractor.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 25-03-22.
//

import Foundation

protocol ListBreedBusinessLogic {
    func attach(view: ListBreedDisplayLogic)
    
    func loadDogBreeds(request: ListBreeds.LoadDogBreeds.Request)
    func goToBreedImages(request: ListBreeds.GoToImages.Request)
}

protocol ListBreedDataStore {
    var breedName: String? { get set }
}

class ListBreedInteractor: ListBreedBusinessLogic, ListBreedDataStore {
    private let presenter: ListBreedPresentationLogic
    private let useCase: ListBreedUseCase
    
    var breedName: String?
    
    init(presenter: ListBreedPresentationLogic, useCase: ListBreedUseCase) {
        self.presenter = presenter
        self.useCase = useCase
    }
    
    func attach(view: ListBreedDisplayLogic) {
        self.presenter.attach(view: view)
    }
    
    func loadDogBreeds(request: ListBreeds.LoadDogBreeds.Request) {
        useCase.breeds { [self] listBreed in
            presenter.presentDogBreeds(listBreed: listBreed)
        }
    }
    
    func goToBreedImages(request: ListBreeds.GoToImages.Request) {
        breedName = request.breedName
        presenter.presentBreedImages(response: ListBreeds.GoToImages.Response())
    }
}
