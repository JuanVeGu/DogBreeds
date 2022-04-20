//
//  BreedImageEntityToBreedImageModel.swift
//  Dog Breeds
//
//  Created by mobdev on 19-04-22.
//

import Foundation

class BreedImageEntityToBreedImageModel: Mapper<BreedImage, Breed.LoadBreedImages.Response> {
    override func reverseMap(value: Breed.LoadBreedImages.Response) -> BreedImage {
        return BreedImage(images: value.message)
    }
}
