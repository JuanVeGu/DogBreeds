//
//  BreedRestApiProtocol.swift
//  Dog Breeds
//
//  Created by Mobdev 6 on 13-04-22.
//

import Foundation

protocol BreedRestApiProtocol {
    func fetchBreedImages(completionHandler: @escaping (Breed.LoadBreedImages.Response?) -> Void)
}
