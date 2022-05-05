//
//  ListBreedServiceLocator.swift
//  Dog Breeds
//
//  Created by Mobdev 6 on 18-04-22.
//

import Foundation

class ListBreedServiceLocator {
    var listBreedUseCase: ListBreedUseCase {
        return ListBreedUseCase(listBreedRepository: listBreedRepository)
    }
    
    private var listBreedRepository: ListBreedRepository {
        return ListBreedApiRepository(
            listBreedRestApi: listBreedRestApi,
            modelMapper: ListBreedEntityToListBreedDomainMapper()
        )
    }
    
    private var listBreedRestApi: ListBreedRestApi {
        return ListBreedURLSessionRestApi(url: "https://dog.ceo/api/breeds/list")
    }
}
