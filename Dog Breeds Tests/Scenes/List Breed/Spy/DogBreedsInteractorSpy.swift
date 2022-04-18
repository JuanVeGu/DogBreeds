//
//  DogBreedsInteractorSpy.swift
//  Dog Breeds Tests
//
//  Created by Juan Vergara Gutiérrez on 25-03-22.
//

import Foundation
@testable import Dog_Breeds

class DogBreedsInteractorSpy: ListBreedBusinessLogic {
    var loadDogBreedsCalled = false
    var goToBreedImagesCalled = false
    
    func loadDogBreeds(request: ListBreeds.LoadDogBreeds.Request) {
        loadDogBreedsCalled = true
    }
    
    func goToBreedImages(request: ListBreeds.GoToImages.Request) {
        goToBreedImagesCalled = true
    }
}
