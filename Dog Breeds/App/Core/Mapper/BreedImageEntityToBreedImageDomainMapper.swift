//
//  BreedImageEntityToBreedImageModel.swift
//  Dog Breeds
//
//  Created by mobdev on 19-04-22.
//

import Foundation

class BreedImageEntityToBreedImageDomainMapper: Mapper<BreedImageDomain, BreedImageEntity> {
    override func reverseMap(value: BreedImageEntity) -> BreedImageDomain {
        return BreedImageDomain(images: value.message)
    }
}
