//
//  ListBreedApiRepository.swift
//  Dog Breeds
//
//  Created by Mobdev 6 on 14-04-22.
//

import Foundation

class ListBreedApiRepository: ListBreedApiRepositoryProtocol {
    private let listBreedRestApi: ListBreedRestApiProtocol
    
    init(listBreedRestApi: ListBreedRestApiProtocol) {
        self.listBreedRestApi = listBreedRestApi
    }
    
    func fetchDogBreeds(completionHandler: @escaping (ListBreeds.LoadDogBreeds.Response?) -> Void) {
        self.listBreedRestApi.fetchDogBreeds { response in
            completionHandler(response)
        }
    }
}
