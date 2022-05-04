//
//  BreedRestApi.swift
//  Dog Breeds
//
//  Created by Mobdev 6 on 13-04-22.
//

import Foundation

protocol BreedImageRestApi {
    func fetchBreedImages(breedName: String, completionHandler: @escaping (BreedModel.LoadBreedImages.Response?) -> Void)
}
