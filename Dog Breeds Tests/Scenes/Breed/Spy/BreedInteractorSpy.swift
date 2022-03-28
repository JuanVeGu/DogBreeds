//
//  BreedInteractorSpy.swift
//  Dog Breeds Tests
//
//  Created by Juan Vergara Gutiérrez on 27-03-22.
//

import Foundation
@testable import Dog_Breeds

class BreedInteractorSpy: BreedBusinessLogic {
    var loadBreedImagesCalled = false
    
    func loadBreedImages(request: Breed.LoadBreedImages.Request) {
        loadBreedImagesCalled = true
    }
}
