//
//  ListBreed.swift
//  Dog Breeds
//
//  Created by Mobdev 6 on 14-04-22.
//

import Foundation

struct ListBreed: Decodable, Equatable {
    let breed: [String]
    
    static func ==(lhs: ListBreed, rhs: ListBreed) -> Bool {
        return lhs.breed == rhs.breed
    }
}
