//
//  BreedImageViewModel.swift
//  Dog Breeds
//
//  Created by mobdev on 05-05-22.
//

import Foundation

struct BreedImageViewModel: Decodable, Equatable {
    let images: [String]
    
    static func ==(lhs: BreedImageViewModel, rhs: BreedImageViewModel) -> Bool {
        return lhs.images == rhs.images
    }
}
