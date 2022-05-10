//
//  BreedImageRestApiMock.swift
//  Dog Breeds Tests
//
//  Created by mobdev on 19-04-22.
//

import Foundation
@testable import Dog_Breeds

class BreedImageRestApiMock: BreedImageRestApi {
    var shouldFail = false
    
    func fetchBreedImages(breedName: String, completionHandler: @escaping (BreedImageEntity?) -> Void) {
        if shouldFail {
            completionHandler(nil)
        } else {
            completionHandler(Seeds.breedImageEntity)
        }
    }
}
