//
//  BreedImageRepository.swift
//  Dog Breeds
//
//  Created by Mobdev 6 on 14-04-22.
//

import Foundation

protocol BreedImageRepository {
    func fetchBreedImages(breedName:String, completionHandler: @escaping (BreedImage?) -> Void)
}
