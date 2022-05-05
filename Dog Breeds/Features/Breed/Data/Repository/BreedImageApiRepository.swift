//
//  BreedImageApiRepository.swift
//  Dog Breeds
//
//  Created by Mobdev 6 on 14-04-22.
//

import Foundation

class BreedImageApiRepository: BreedImageRepository {
    private let breedImageRestApi: BreedImageRestApi
    private let modelMapper: Mapper<BreedImageDomain, BreedImageEntity>
    
    init(breedImageRestApi: BreedImageRestApi, modelMapper: Mapper<BreedImageDomain, BreedImageEntity>) {
        self.breedImageRestApi = breedImageRestApi
        self.modelMapper = modelMapper
    }
    
    func fetchBreedImages(breedName: String, completionHandler: @escaping (BreedImageDomain?) -> Void) {
        self.breedImageRestApi.fetchBreedImages(breedName: breedName) { response in
            if let response = response {
                let model = self.modelMapper.reverseMap(value: response)
                completionHandler(model)
            } else {
                completionHandler(nil)
            }
        }
    }
}
