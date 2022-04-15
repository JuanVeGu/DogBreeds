//
//  BreedImageUseCase.swift
//  Dog Breeds
//
//  Created by Mobdev 6 on 14-04-22.
//

import Foundation

struct BreedImageUseCase {
    private let breedImageRepository: BreedImageApiRepositoryProtocol
    
    init(breedImageRepository: BreedImageApiRepositoryProtocol) {
        self.breedImageRepository = breedImageRepository
    }
}
