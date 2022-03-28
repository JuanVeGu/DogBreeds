//
//  Seeds.swift
//  Dog Breeds Tests
//
//  Created by Juan Vergara Gutiérrez on 25-03-22.
//

import Foundation
@testable import Dog_Breeds

struct Seeds {
    static let dogBreedsResponse = DogBreeds.LoadDogBreeds.Response(message: [
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
        "bouvier",
        "boxer",
        "brabancon",
        "briard",
        "buhund",
        "bulldog",
        "bullterrier",
        "cattledog",
        "chihuahua",
        "chow",
        "clumber",
    ], status: "success")
    
    static let breedImages = Breed.LoadBreedImages.Response(message: [
        "https://images.dog.ceo/breeds/hound-afghan/n02088094_1003.jpg",
        "https://images.dog.ceo/breeds/hound-afghan/n02088094_1007.jpg",
        "https://images.dog.ceo/breeds/hound-afghan/n02088094_1023.jpg",
        "https://images.dog.ceo/breeds/hound-afghan/n02088094_10263.jpg",
        "https://images.dog.ceo/breeds/hound-afghan/n02088094_10715.jpg",
        "https://images.dog.ceo/breeds/hound-afghan/n02088094_10822.jpg",
        "https://images.dog.ceo/breeds/hound-afghan/n02088094_10832.jpg",
        "https://images.dog.ceo/breeds/hound-afghan/n02088094_10982.jpg",
        "https://images.dog.ceo/breeds/hound-afghan/n02088094_11006.jpg",
        "https://images.dog.ceo/breeds/hound-afghan/n02088094_11172.jpg",
        "https://images.dog.ceo/breeds/hound-afghan/n02088094_11182.jpg",
        "https://images.dog.ceo/breeds/hound-afghan/n02088094_1126.jpg",
        "https://images.dog.ceo/breeds/hound-afghan/n02088094_1128.jpg",
        "https://images.dog.ceo/breeds/hound-afghan/n02088094_11432.jpg",
    ], status: "success")
}
