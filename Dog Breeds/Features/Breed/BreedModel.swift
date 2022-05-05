//
//  BreedModel.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 25-03-22.
//

import Foundation

enum BreedModel {
    enum GoToBreedDetail {
        struct Request {
            let name: String?
            let urlImage: String
        }
        
        struct Response {
            let name: String?
            let urlImage: String
        }
        
        struct ViewModel {
            let breedDetailList: [BreedDetail]
        }
    }
}
