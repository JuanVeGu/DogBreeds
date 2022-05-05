//
//  ImageToBreedDetailViewModelMapper.swift
//  Dog Breeds
//
//  Created by mobdev on 28-04-22.
//

import Foundation

class ImageToBreedDetailViewModelMapper: Mapper<BreedDetail, (String?, String)> {
    override func reverseMap(value: (String?, String)) -> BreedDetail {
        return BreedDetail(name: value.0, urlImage: value.1)
    }
}
