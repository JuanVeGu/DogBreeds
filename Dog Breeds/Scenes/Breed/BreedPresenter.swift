//
//  BreedPresenter.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 25-03-22.
//

import Foundation

protocol BreedPresentationLogic {
    func presentBreedImages(response: Breed.LoadBreedImages.Response?)
}

class BreedPresenter: BreedPresentationLogic {
    weak var view: BreedDisplayLogic?
    
    func presentBreedImages(response: Breed.LoadBreedImages.Response?) {
        if let response = response {
            view?.displayBreedImages(viewModel: Breed.LoadBreedImages.ViewModel(images: response.message))
        }
    }
}
