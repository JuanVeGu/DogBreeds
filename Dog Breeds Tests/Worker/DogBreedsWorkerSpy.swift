//
//  DogBreedsWorkerSpy.swift
//  Dog Breeds Tests
//
//  Created by Juan Vergara Gutiérrez on 25-03-22.
//

import Foundation
@testable import Dog_Breeds

class DogBreedsWorkerSpy: DogBreedsWorker {
    var fetchDogBreedsCalled = false
    var fetchBreedImagesCalled = false
    
    override func fetchDogBreeds(completionBlock: @escaping (ListBreed.LoadDogBreeds.Response?) -> Void) {
        fetchDogBreedsCalled = true
        completionBlock(Seeds.dogBreedsResponse)
    }
    
    override func fetchBreedImages(completionBlock: @escaping (Breed.LoadBreedImages.Response?) -> Void) {
        fetchBreedImagesCalled = true
        completionBlock(Seeds.breedImages)
    }
    
}
