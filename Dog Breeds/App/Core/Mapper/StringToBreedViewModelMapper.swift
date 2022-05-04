//
//  StringToBreedViewModelMapper.swift
//  Dog Breeds
//
//  Created by mobdev on 04-05-22.
//

import Foundation

class StringToBreedViewModelMapper: Mapper<Breed, String> {
    override func reverseMap(value: String) -> Breed {
        return Breed(name: value)
    }
}
