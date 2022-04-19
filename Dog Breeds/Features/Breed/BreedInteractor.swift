//
//  BreedInteractor.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 25-03-22.
//

import Foundation

protocol BreedBusinessLogic {
    func attach(view: BreedDisplayLogic)
    func loadBreedImages(request: Breed.LoadBreedImages.Request)
}

class BreedInteractor: BreedBusinessLogic {
    private let presenter: BreedPresentationLogic
    private let useCase: BreedImageUseCase
    
    init(presenter: BreedPresentationLogic, useCase: BreedImageUseCase) {
        self.presenter = presenter
        self.useCase = useCase
    }
    
    func attach(view: BreedDisplayLogic) {
        presenter.attach(view: view)
    }
    
    func loadBreedImages(request: Breed.LoadBreedImages.Request) {
        guard let name = request.name else {
            return
        }
        
        useCase.fetchBreedImages(breedName: name) { [self] breedImage in
            presenter.presentBreedImages(breedImage: breedImage)
        }
    }
    
}
