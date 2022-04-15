//
//  DogBreedsModel.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 25-03-22.
//

import Foundation

enum ListBreeds {
    enum LoadDogBreeds {
        struct Request {}
        
        struct Response: Codable {
            let message: [String]
            let status: String
        }
        
        struct ViewModel {
            let breeds: [String]
        }
    }
    
    enum GoToImages {
        struct Request {
            let breedName: String
        }
        struct Response { }
        struct ViewModel {}
    }
}
