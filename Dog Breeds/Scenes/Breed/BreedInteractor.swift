//
//  BreedInteractor.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 25-03-22.
//

import Foundation

protocol BreedBusinessLogic {
    func loadBreedImages(request: Breed.LoadBreedImages.Request)
}

class BreedInteractor: BreedBusinessLogic {
    var presenter: BreedPresentationLogic?
    private let useCase: BreedImageUseCase
    
    init(useCase: BreedImageUseCase) {
        self.useCase = useCase
    }
    
    func loadBreedImages(request: Breed.LoadBreedImages.Request) {
        useCase.fetchBreedImages { [self] response in
            presenter?.presentBreedImages(response: response)
        }
    }
    
}
