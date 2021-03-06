//
//  ListBreedRepositoryMock.swift
//  Dog Breeds Tests
//
//  Created by mobdev on 20-04-22.
//

import Foundation
@testable import Dog_Breeds

class ListBreedRepositoryMock: ListBreedRepository {
    let modelMapper = ListBreedEntityToListBreedDomainMapper()
    var shouldFail = false
    
    func fetchDogBreeds(completionHandler: @escaping (ListBreedDomain?) -> Void) {
        if shouldFail {
            completionHandler(nil)
        } else {
            let model = modelMapper.reverseMap(value: Seeds.listBreedEntity)
            completionHandler(model)
        }
    }
}
