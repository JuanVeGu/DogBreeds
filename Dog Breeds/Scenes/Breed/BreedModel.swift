//
//  BreedModel.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 25-03-22.
//

import Foundation

enum Breed {
    enum LoadBreedImages {
        struct Request { }
        
        struct Response: Codable {
            let message: [String]
            let status: String
        }
        
        struct ViewModel {
            let images: [String]
        }
    }
}
