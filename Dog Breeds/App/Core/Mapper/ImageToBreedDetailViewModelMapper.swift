//
//  ImageToBreedDetailViewModelMapper.swift
//  Dog Breeds
//
//  Created by mobdev on 28-04-22.
//

import Foundation

class ImageToBreedDetailViewModelMapper: Mapper<BreedDetail, BreedModel.GoToBreedDetail.Response> {
    override func reverseMap(value: BreedModel.GoToBreedDetail.Response) -> BreedDetail {
        return BreedDetail(name: value.name, urlImage: value.urlImage)
    }
}
