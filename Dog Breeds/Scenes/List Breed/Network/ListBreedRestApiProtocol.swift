//
//  ListBreedRestApiProtocol.swift
//  Dog Breeds
//
//  Created by Mobdev 6 on 13-04-22.
//

import Foundation

protocol ListBreedRestApiProtocol {
    func getAllBreeds(completionHandler: @escaping (ListBreed.LoadDogBreeds.Response?) -> Void)
}
