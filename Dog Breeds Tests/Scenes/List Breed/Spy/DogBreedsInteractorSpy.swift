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
    var goToBreedImagesCalled = false
    
    func loadDogBreeds(request: ListBreed.LoadDogBreeds.Request) {
        loadDogBreedsCalled = true
    }
    
    func goToBreedImages(request: ListBreed.GoToImages.Request) {
        goToBreedImagesCalled = true
    }
}
