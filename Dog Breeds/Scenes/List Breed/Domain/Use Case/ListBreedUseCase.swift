//
//  ListBreedUseCase.swift
//  Dog Breeds
//
//  Created by Mobdev 6 on 14-04-22.
//

import Foundation

struct ListBreedUseCase {
    private let listBreedRepository: ListBreedApiRepositoryProtocol
    
    init(listBreedRepository: ListBreedApiRepositoryProtocol) {
        self.listBreedRepository = listBreedRepository
    }
    
    func breeds(completionHandler: @escaping (ListBreeds.LoadDogBreeds.Response?) -> Void) {
        listBreedRepository.fetchDogBreeds { response in
            completionHandler(response)
        }
    }
}
