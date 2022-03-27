//
//  DogBreedsInteractorSpy.swift
//  Dog Breeds Tests
//
//  Created by Juan Vergara Gutiérrez on 25-03-22.
//

import Foundation
@testable import Dog_Breeds

class DogBreedsInteractorSpy: DogBreedsBusinessLogic {
    var loadDogBreedsCalled = false
    
    func loadDogBreeds(request: DogBreeds.LoadDogBreeds.Request) {
        loadDogBreedsCalled = true
    }
}
