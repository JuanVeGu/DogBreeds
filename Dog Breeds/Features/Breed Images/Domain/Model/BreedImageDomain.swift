//
//  BreedImage.swift
//  Dog Breeds
//
//  Created by Mobdev 6 on 14-04-22.
//

import Foundation

struct BreedImageDomain: Decodable, Equatable {
    let images: [String]
    
    static func ==(lhs: BreedImageDomain, rhs: BreedImageDomain) -> Bool {
        return lhs.images == rhs.images
    }
}
