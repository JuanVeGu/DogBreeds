//
//  DogBreedsPresenter.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 25-03-22.
//

import Foundation

protocol ListBreedPresentationLogic {
    func attach(view: ListBreedDisplayLogic)
    
    func presentDogBreeds(listBreed: ListBreed?)
    func presentBreedImages(response: ListBreeds.GoToImages.Response)
}

class ListBreedPresenter: ListBreedPresentationLogic {
    weak var view: ListBreedDisplayLogic?
    
    func attach(view: ListBreedDisplayLogic) {
        self.view = view
    }
    
    func presentDogBreeds(listBreed: ListBreed?) {
        if let listBreed = listBreed {
            view?.displayBreeds(viewModel: ListBreeds.LoadDogBreeds.ViewModel(breeds: listBreed.breed))
        }
    }
    
    func presentBreedImages(response: ListBreeds.GoToImages.Response) {
        view?.displayBreedImages(viewModel: ListBreeds.GoToImages.ViewModel())
    }
}
