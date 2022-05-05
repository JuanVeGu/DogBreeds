//
//  ListBreedApiRepository.swift
//  Dog Breeds
//
//  Created by Mobdev 6 on 14-04-22.
//

import Foundation

class ListBreedApiRepository: ListBreedRepository {
    private let listBreedRestApi: ListBreedRestApi
    private let modelMapper: Mapper<ListBreedDomain, ListBreedEntity>
    
    init(listBreedRestApi: ListBreedRestApi, modelMapper: Mapper<ListBreedDomain, ListBreedEntity>) {
        self.listBreedRestApi = listBreedRestApi
        self.modelMapper = modelMapper
    }
    
    func fetchDogBreeds(completionHandler: @escaping (ListBreedDomain?) -> Void) {
        self.listBreedRestApi.fetchDogBreeds { response in
            if let response = response {
                let model = self.modelMapper.reverseMap(value: response)
                completionHandler(model)
            } else {
                completionHandler(nil)
            }
        }
    }
}
