//
//  BreedPresenter.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 25-03-22.
//

import Foundation

protocol BreedPresentationLogic {
    func attach(view: BreedDisplayLogic)
    func presentBreedImages(breedImage: BreedImage?)
}

class BreedPresenter: BreedPresentationLogic {
    weak var view: BreedDisplayLogic?
    
    func attach(view: BreedDisplayLogic) {
        self.view = view
    }
    
    func presentBreedImages(breedImage: BreedImage?) {
        if let breedImage = breedImage {
            view?.displayBreedImages(viewModel: Breed.LoadBreedImages.ViewModel(images: breedImage.images))
        }
    }
}
