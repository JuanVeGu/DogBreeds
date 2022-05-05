//
//  ListBreed.swift
//  Dog Breeds
//
//  Created by Mobdev 6 on 14-04-22.
//

import Foundation

struct ListBreedDomain: Decodable, Equatable {
    let breed: [String]
    
    static func ==(lhs: ListBreedDomain, rhs: ListBreedDomain) -> Bool {
        return lhs.breed == rhs.breed
    }
}
