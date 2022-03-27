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
    
    override func fetchDogBreeds(completionBlock: @escaping (DogBreeds.LoadDogBreeds.Response?) -> Void) {
        fetchDogBreedsCalled = true
        completionBlock(Seeds.dogBreedsResponse)
    }
    
}
