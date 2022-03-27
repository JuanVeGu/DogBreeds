//
//  BreedPresenterSpy.swift
//  Dog Breeds Tests
//
//  Created by Juan Vergara Gutiérrez on 27-03-22.
//

import Foundation
@testable import Dog_Breeds

class BreedPresenterSpy: BreedPresentationLogic {
    var images: [String]?
    var presentBreedImagesCalled = false
    
    func presentBreedImages(response: Breed.LoadBreedImages.Response?) {
        if let response = response {
            presentBreedImagesCalled = true
            images = response.message
        }
    }
    
}
