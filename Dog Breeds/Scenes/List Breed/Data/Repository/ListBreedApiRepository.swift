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
}
