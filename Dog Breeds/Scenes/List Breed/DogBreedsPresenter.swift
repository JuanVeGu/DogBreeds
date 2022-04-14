//
//  DogBreedsPresenter.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 25-03-22.
//

import Foundation

protocol DogBreedsPresentationLogic {
    func presentDogBreeds(response: ListBreed.LoadDogBreeds.Response?)
    func presentBreedImages(response: ListBreed.GoToImages.Response)
}

class DogBreedsPresenter: DogBreedsPresentationLogic {
    weak var view: DogBreedsDisplayLogic?
    
    func presentDogBreeds(response: ListBreed.LoadDogBreeds.Response?) {
        if let response = response {
            view?.displayBreeds(viewModel: ListBreed.LoadDogBreeds.ViewModel(breeds: response.message))
        }
    }
    
    func presentBreedImages(response: ListBreed.GoToImages.Response) {
        view?.displayBreedImages(viewModel: ListBreed.GoToImages.ViewModel())
    }
}
