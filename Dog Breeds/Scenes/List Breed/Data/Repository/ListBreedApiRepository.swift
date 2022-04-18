//
//  ListBreedApiRepository.swift
//  Dog Breeds
//
//  Created by Mobdev 6 on 14-04-22.
//

import Foundation

class ListBreedApiRepository: ListBreedRepository {
    private let listBreedRestApi: ListBreedRestApi
    
    init(listBreedRestApi: ListBreedRestApi) {
        self.listBreedRestApi = listBreedRestApi
    }
    
    func fetchDogBreeds(completionHandler: @escaping (ListBreeds.LoadDogBreeds.Response?) -> Void) {
        self.listBreedRestApi.fetchDogBreeds { response in
            completionHandler(response)
        }
    }
}
