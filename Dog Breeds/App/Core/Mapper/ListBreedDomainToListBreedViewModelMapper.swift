//
//  ListBreedDomainToListBreedViewModelMapper.swift
//  Dog Breeds
//
//  Created by mobdev on 05-05-22.
//

import Foundation

class ListBreedDomainToListBreedViewModelMapper: Mapper<ListBreedViewModel, ListBreedDomain> {
    override func reverseMap(value: ListBreedDomain) -> ListBreedViewModel {
        return ListBreedViewModel(breed: value.breed)
    }
}
