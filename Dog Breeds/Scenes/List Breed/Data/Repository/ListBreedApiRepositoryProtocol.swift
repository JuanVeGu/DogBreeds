//
//  ListBreedApiRepositoryProtocol.swift
//  Dog Breeds
//
//  Created by Mobdev 6 on 14-04-22.
//

import Foundation

protocol ListBreedApiRepositoryProtocol {
    func fetchDogBreeds(completionHandler: @escaping (ListBreeds.LoadDogBreeds.Response?) -> Void)
}
