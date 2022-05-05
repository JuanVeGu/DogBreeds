//
//  Seeds.swift
//  Dog Breeds Tests
//
//  Created by Juan Vergara Gutiérrez on 25-03-22.
//

import Foundation
@testable import Dog_Breeds

struct Seeds {
    static let dogBreedsResponse = ListBreedEntity(message: [
        "affenpinscher",
        "african",
        "airedale",
        "akita",
        "appenzeller",
        "australian",
        "basenji",
        "beagle",
        "bluetick",
        "borzoi",
    ], status: "success")
    
    static let breedImages = BreedImageEntity(message: [
        "https://images.dog.ceo/breeds/hound-afghan/n02088094_1003.jpg",
        "https://images.dog.ceo/breeds/hound-afghan/n02088094_1007.jpg",
        "https://images.dog.ceo/breeds/hound-afghan/n02088094_1023.jpg",
        "https://images.dog.ceo/breeds/hound-afghan/n02088094_10263.jpg",
        "https://images.dog.ceo/breeds/hound-afghan/n02088094_10715.jpg",
        "https://images.dog.ceo/breeds/hound-afghan/n02088094_10822.jpg",
        "https://images.dog.ceo/breeds/hound-afghan/n02088094_10832.jpg",
        "https://images.dog.ceo/breeds/hound-afghan/n02088094_10982.jpg",
        "https://images.dog.ceo/breeds/hound-afghan/n02088094_11006.jpg",
    ], status: "success")
    
    static let breedImageDetail = (
        "schnauzer",
        "https://images.dog.ceo/breeds/hound-afghan/n02088094_1003.jpg"
    )
    
    static let responseError = ResponseError(
        code: 404,
        status: "error",
        message: "Breed not found (master breed does not exist)"
    )
}

struct ResponseError: Codable {
    let code: Int
    let status: String
    let message: String
}
