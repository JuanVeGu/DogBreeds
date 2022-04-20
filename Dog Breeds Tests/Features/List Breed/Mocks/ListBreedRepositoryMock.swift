//
//  ListBreedRepositoryMock.swift
//  Dog Breeds Tests
//
//  Created by mobdev on 20-04-22.
//

import Foundation
@testable import Dog_Breeds

class ListBreedRepositoryMock: ListBreedRepository {
    let modelMapper = ListBreedEntityToListBreedModelMapper()
    var shouldFail = false
    
    func fetchDogBreeds(completionHandler: @escaping (ListBreed?) -> Void) {
        if shouldFail {
            completionHandler(nil)
        } else {
            let model = modelMapper.reverseMap(value: Seeds.dogBreedsResponse)
            completionHandler(model)
        }
    }
}
