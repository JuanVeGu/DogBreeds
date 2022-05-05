//
//  BreedServiceLocator.swift
//  Dog Breeds
//
//  Created by mobdev on 19-04-22.
//

import Foundation

class BreedServiceLocator {
    var breedUseCase: BreedImageUseCase {
        return BreedImageUseCase(breedImageRepository: breedImageRepository)
    }

    var breedImageRepository: BreedImageRepository {
        return BreedImageApiRepository(
            breedImageRestApi: breedImageRestApi,
            modelMapper: BreedImageEntityToBreedImageDomainMapper()
        )
    }
    
    var breedImageRestApi: BreedImageRestApi {
        return BreedImageURLSessionRestApi()
    }
}
