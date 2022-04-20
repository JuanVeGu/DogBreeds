//
//  BreedImage.swift
//  Dog Breeds
//
//  Created by Mobdev 6 on 14-04-22.
//

import Foundation

struct BreedImage: Decodable, Equatable {
    let images: [String]
    
    static func ==(lhs: BreedImage, rhs: BreedImage) -> Bool {
        return lhs.images == rhs.images
    }
}
