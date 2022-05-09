//
//  ListBreedDisplayLogicMock.swift
//  Dog Breeds Tests
//
//  Created by mobdev on 09-05-22.
//

import Foundation
@testable import Dog_Breeds

class ListBreedDisplayLogicMock: ListBreedDisplayLogic {
    var didCallDisplayBreeds = false
    var didCallDisplayBreedImages = false
    
    func displayBreeds(viewModel: ListBreedViewModel) {
        didCallDisplayBreeds = true
    }
    
    func displayBreedImages(breed: Breed) {
        didCallDisplayBreedImages = true
    }
}
