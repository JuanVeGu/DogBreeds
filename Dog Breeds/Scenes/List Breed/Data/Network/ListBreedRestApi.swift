//
//  ListBreedRestApiProtocol.swift
//  Dog Breeds
//
//  Created by Mobdev 6 on 13-04-22.
//

import Foundation

protocol ListBreedRestApi {
    func fetchDogBreeds(completionHandler: @escaping (ListBreeds.LoadDogBreeds.Response?) -> Void)
}
