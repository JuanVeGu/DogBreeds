//
//  DogBreedsWorker.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 25-03-22.
//

import Foundation

class DogBreedsWorker {
    private let listBreedRestAPI: ListBreedRestApiProtocol?
    private let breedRestAPI: BreedRestApiProtocol?
    
    init(listBreedRestAPI: ListBreedRestApiProtocol? = nil, breedRestAPI: BreedRestApiProtocol? = nil) {
        self.listBreedRestAPI = listBreedRestAPI
        self.breedRestAPI = breedRestAPI
    }
    
    func fetchDogBreeds(completionBlock: @escaping (ListBreed.LoadDogBreeds.Response?) -> Void) {
        self.listBreedRestAPI?.fetchDogBreeds(completionHandler: { response in
            completionBlock(response)
        })
    }
    
    func fetchBreedImages(completionBlock: @escaping (Breed.LoadBreedImages.Response?) -> Void) {
        self.breedRestAPI?.fetchBreedImages(completionHandler: { response in
            completionBlock(response)
        })
    }
    
}
