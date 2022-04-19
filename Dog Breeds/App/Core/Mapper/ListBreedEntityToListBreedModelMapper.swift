//
//  ListBreedEntityToListBreedModelMapper.swift
//  Dog Breeds
//
//  Created by mobdev on 19-04-22.
//

import Foundation

class ListBreedEntityToListBreedModelMapper: Mapper<ListBreed, ListBreeds.LoadDogBreeds.Response> {
    override func reverseMap(value: ListBreeds.LoadDogBreeds.Response) -> ListBreed {
        return ListBreed(breed: value.message)
    }
}
