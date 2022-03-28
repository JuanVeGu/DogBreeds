//
//  DogBreedsViewSpy.swift
//  Dog Breeds Tests
//
//  Created by Juan Vergara Gutiérrez on 25-03-22.
//

import Foundation
@testable import Dog_Breeds

class DogBreedsViewSpy: DogBreedsDisplayLogic {
    var viewModel: DogBreeds.LoadDogBreeds.ViewModel!
    var viewDogBreedsCalled = false
    var displayBreedImagesViewCalled = false
    
    func displayBreeds(viewModel: DogBreeds.LoadDogBreeds.ViewModel) {
        viewDogBreedsCalled = true
        self.viewModel = viewModel
    }
    
    func displayBreedImages(viewModel: DogBreeds.GoToImages.ViewModel) {
        displayBreedImagesViewCalled = true
    }
}
