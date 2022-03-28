//
//  BreedViewSpy.swift
//  Dog Breeds Tests
//
//  Created by Juan Vergara Gutiérrez on 27-03-22.
//

import Foundation
@testable import Dog_Breeds

class BreedViewSpy: BreedDisplayLogic {
    var viewModel: Breed.LoadBreedImages.ViewModel!
    var displayBreedImagesCalled = false
    
    func displayBreedImages(viewModel: Breed.LoadBreedImages.ViewModel) {
        displayBreedImagesCalled = true
        self.viewModel = viewModel
    }
}
