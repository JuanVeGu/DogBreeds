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

protocol BreedDataStore {
  var breedName: String? { get set }
}

class BreedInteractor: BreedBusinessLogic, BreedDataStore {
    var presenter: BreedPresentationLogic?
    var worker = DogBreedsWorker()
    
    var breedName: String?
    
    func loadBreedImages(request: Breed.LoadBreedImages.Request) {
        if let name = breedName {
            worker.fetchBreedImages(breedName: name, completionBlock: { [self] response in
                presenter?.presentBreedImages(response: response)
            })
        } else {
            // TODO: Agregar alerta de dato faltante
        }
        
    }
    
}
