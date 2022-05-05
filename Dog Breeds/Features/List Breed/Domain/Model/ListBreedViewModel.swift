//
//  ListBreedViewModel.swift
//  Dog Breeds
//
//  Created by mobdev on 05-05-22.
//

import Foundation

struct ListBreedViewModel: Decodable, Equatable {
    let breed: [String]
    
    static func ==(lhs: ListBreedViewModel, rhs: ListBreedViewModel) -> Bool {
        return lhs.breed == rhs.breed
    }
}
