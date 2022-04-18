//
//  DogBreedsViewSpy.swift
//  Dog Breeds Tests
//
//  Created by Juan Vergara Gutiérrez on 25-03-22.
//

import Foundation
@testable import Dog_Breeds

class DogBreedsViewSpy: ListBreedDisplayLogic {
    var viewModel: ListBreeds.LoadDogBreeds.ViewModel!
    var viewDogBreedsCalled = false
    var displayBreedImagesViewCalled = false
    
    func displayBreeds(viewModel: ListBreeds.LoadDogBreeds.ViewModel) {
        viewDogBreedsCalled = true
        self.viewModel = viewModel
    }
    
    func displayBreedImages(viewModel: ListBreeds.GoToImages.ViewModel) {
        displayBreedImagesViewCalled = true
    }
}
