//
//  BreedImageUseCase.swift
//  Dog Breeds
//
//  Created by Mobdev 6 on 14-04-22.
//

import Foundation

struct BreedImageUseCase {
    private let breedImageRepository: BreedImageApiRepositoryProtocol
    private let breedName: String
    
    init(breedName: String, breedImageRepository: BreedImageApiRepositoryProtocol) {
        self.breedName = breedName
        self.breedImageRepository = breedImageRepository
    }
    
    func fetchBreedImages(completionHandler: @escaping (Breed.LoadBreedImages.Response?) -> Void) {
        self.breedImageRepository.fetchBreedImages { response in
            completionHandler(response)
        }
    }
}
