//
//  DogBreedsPresenter.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 25-03-22.
//

import Foundation

protocol DogBreedsPresentationLogic {
    func presentDogBreeds(response: DogBreeds.LoadDogBreeds.Response?)
    func presentBreedImages(response: DogBreeds.GoToImages.Response)
}

class DogBreedsPresenter: DogBreedsPresentationLogic {
    weak var view: DogBreedsDisplayLogic?
    
    func presentDogBreeds(response: DogBreeds.LoadDogBreeds.Response?) {
        if let response = response {
            view?.displayBreeds(viewModel: DogBreeds.LoadDogBreeds.ViewModel(breeds: response.message))
        }
    }
    
    func presentBreedImages(response: DogBreeds.GoToImages.Response) {
        view?.displayBreedImages(viewModel: DogBreeds.GoToImages.ViewModel())
    }
}
