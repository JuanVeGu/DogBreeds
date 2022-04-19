//
//  BreedImageUseCase.swift
//  Dog Breeds
//
//  Created by Mobdev 6 on 14-04-22.
//

import Foundation

struct BreedImageUseCase {
    private let breedImageRepository: BreedImageRepository
    
    init(breedImageRepository: BreedImageRepository) {
        self.breedImageRepository = breedImageRepository
    }
    
    func fetchBreedImages(breedName: String, completionHandler: @escaping (BreedImage?) -> Void) {
        self.breedImageRepository.fetchBreedImages(breedName: breedName) { response in
            completionHandler(response)
        }
    }
}
