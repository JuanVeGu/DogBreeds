//
//  BreedImageDomainToBreedImageViewModelMapper.swift
//  Dog Breeds
//
//  Created by mobdev on 05-05-22.
//

import Foundation

class BreedImageDomainToBreedImageViewModelMapper: Mapper<BreedImageViewModel, BreedImageDomain> {
    override func reverseMap(value: BreedImageDomain) -> BreedImageViewModel {
        return BreedImageViewModel(images: value.images)
    }
}
