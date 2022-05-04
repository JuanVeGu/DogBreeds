//
//  BreedImageEntityToBreedImageModel.swift
//  Dog Breeds
//
//  Created by mobdev on 19-04-22.
//

import Foundation

class BreedImageEntityToBreedImageModel: Mapper<BreedImage, BreedModel.LoadBreedImages.Response> {
    override func reverseMap(value: BreedModel.LoadBreedImages.Response) -> BreedImage {
        return BreedImage(images: value.message)
    }
}
