//
//  ListBreedEntityToListBreedModelMapper.swift
//  Dog Breeds
//
//  Created by mobdev on 19-04-22.
//

import Foundation

class ListBreedEntityToListBreedDomainMapper: Mapper<ListBreedDomain, ListBreedEntity> {
    override func reverseMap(value: ListBreedEntity) -> ListBreedDomain {
        return ListBreedDomain(breed: value.message)
    }
}
