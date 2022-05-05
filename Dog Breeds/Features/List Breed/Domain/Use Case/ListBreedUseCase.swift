//
//  ListBreedUseCase.swift
//  Dog Breeds
//
//  Created by Mobdev 6 on 14-04-22.
//

import Foundation

struct ListBreedUseCase {
    private let listBreedRepository: ListBreedRepository
    
    init(listBreedRepository: ListBreedRepository) {
        self.listBreedRepository = listBreedRepository
    }
    
    func breeds(completionHandler: @escaping (ListBreedDomain?) -> Void) {
        listBreedRepository.fetchDogBreeds { listBreed in
            completionHandler(listBreed)
        }
    }
}
