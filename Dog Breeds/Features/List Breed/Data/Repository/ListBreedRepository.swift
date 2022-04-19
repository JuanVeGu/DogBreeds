//
//  ListBreedApiRepositoryProtocol.swift
//  Dog Breeds
//
//  Created by Mobdev 6 on 14-04-22.
//

import Foundation

protocol ListBreedRepository {
    func fetchDogBreeds(completionHandler: @escaping (ListBreed?) -> Void)
}
