//
//  DogBreedsPresenter.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 25-03-22.
//

import Foundation

protocol ListBreedPresentationLogic {
    func attach(view: ListBreedDisplayLogic)
    
    func presentDogBreeds(response: ListBreeds.LoadDogBreeds.Response?)
    func presentBreedImages(response: ListBreeds.GoToImages.Response)
}

class ListBreedPresenter: ListBreedPresentationLogic {
    weak var view: ListBreedDisplayLogic?
    
    func attach(view: ListBreedDisplayLogic) {
        self.view = view
    }
    
    func presentDogBreeds(response: ListBreeds.LoadDogBreeds.Response?) {
        if let response = response {
            view?.displayBreeds(viewModel: ListBreeds.LoadDogBreeds.ViewModel(breeds: response.message))
        }
    }
    
    func presentBreedImages(response: ListBreeds.GoToImages.Response) {
        view?.displayBreedImages(viewModel: ListBreeds.GoToImages.ViewModel())
    }
}
