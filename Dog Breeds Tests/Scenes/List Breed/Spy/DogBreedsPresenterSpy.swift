//
//  DogBreedsPresenterSpy.swift
//  Dog Breeds Tests
//
//  Created by Juan Vergara Gutiérrez on 25-03-22.
//

import Foundation
@testable import Dog_Breeds

class DogBreedsPresenterSpy: ListBreedPresentationLogic {
    var dogBreeds: [String]?
    var presentDogBreedsCalled = false
    var presentBreedImagesCalled = false
    
    func attach(view: ListBreedDisplayLogic) {
        
    }
    
    func presentDogBreeds(listBreed: ListBreed?) {
        if let listBreed = listBreed {
            presentDogBreedsCalled = true
            dogBreeds = listBreed.breed
        }
    }
    
    func presentBreedImages(response: ListBreeds.GoToImages.Response) {
        presentBreedImagesCalled = true
    }
    
}
