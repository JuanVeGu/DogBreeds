//
//  DogBreedsPresenterSpy.swift
//  Dog Breeds Tests
//
//  Created by Juan Vergara Gutiérrez on 25-03-22.
//

import Foundation
@testable import Dog_Breeds

class DogBreedsPresenterSpy: DogBreedsPresentationLogic {
    var dogBreeds: [String]?
    var presentDogBreedsCalled = false
    var presentBreedImagesCalled = false
    
    func presentDogBreeds(response: ListBreeds.LoadDogBreeds.Response?) {
        if let response = response {
            presentDogBreedsCalled = true
            dogBreeds = response.message
        }
    }
    
    func presentBreedImages(response: ListBreeds.GoToImages.Response) {
        presentBreedImagesCalled = true
    }
    
}
