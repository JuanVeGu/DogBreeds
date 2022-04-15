//
//  BreedImageApiRepository.swift
//  Dog Breeds
//
//  Created by Mobdev 6 on 14-04-22.
//

import Foundation

class BreedImageApiRepository: BreedImageApiRepositoryProtocol {
    private let breedImageRestApi: BreedRestApiProtocol
    
    init(breedImageRestApi: BreedRestApiProtocol) {
        self.breedImageRestApi = breedImageRestApi
    }
}