//
//  ListBreedRestApiMock.swift
//  Dog Breeds Tests
//
//  Created by mobdev on 19-04-22.
//

import Foundation
@testable import Dog_Breeds

class ListBreedRestApiMock: ListBreedRestApi {
    var shouldFail = false
    
    func fetchDogBreeds(completionHandler: @escaping (ListBreedEntity?) -> Void) {
        if shouldFail {
            completionHandler(nil)
        } else {
            completionHandler(Seeds.dogBreedsResponse)
        }
    }
}
