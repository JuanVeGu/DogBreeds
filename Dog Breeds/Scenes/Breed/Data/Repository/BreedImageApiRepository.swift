//
//  BreedImageApiRepository.swift
//  Dog Breeds
//
//  Created by Mobdev 6 on 14-04-22.
//

import Foundation

class BreedImageApiRepository: BreedImageRepository {
    private let breedImageRestApi: BreedImageRestApi
    
    init(breedImageRestApi: BreedImageRestApi) {
        self.breedImageRestApi = breedImageRestApi
    }
    
    func fetchBreedImages(breedName:String, completionHandler: @escaping (Breed.LoadBreedImages.Response?) -> Void) {
        self.breedImageRestApi.fetchBreedImages(breedName: breedName) { response in
            completionHandler(response)
        }
    }
}
