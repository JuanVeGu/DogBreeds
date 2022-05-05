//
//  BreedImageRepositoryMock.swift
//  Dog Breeds Tests
//
//  Created by mobdev on 20-04-22.
//

import Foundation
@testable import Dog_Breeds

class BreedImageRepositoryMock: BreedImageRepository {
    let modelMapper = BreedImageEntityToBreedImageDomainMapper()
    var shouldFail = false
    
    func fetchBreedImages(breedName: String, completionHandler: @escaping (BreedImageDomain?) -> Void) {
        if shouldFail {
            completionHandler(nil)
        } else {
            let model = modelMapper.reverseMap(value: Seeds.breedImages)
            completionHandler(model)
        }
    }
}
