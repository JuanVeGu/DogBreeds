//
//  DogBreedsWorker.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 25-03-22.
//

import Foundation

class DogBreedsWorker {
    func fetchDogBreeds(completionBlock: @escaping (DogBreeds.LoadDogBreeds.Response?) -> Void) {
        guard let url = URL(string: "https://dog.ceo/api/breeds/list") else {
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completionBlock(nil)
                return
            } else if let data = data, let response = try? JSONDecoder().decode(DogBreeds.LoadDogBreeds.Response.self, from: data) {
                completionBlock(response)
            } else {
                completionBlock(nil)
            }
        }
        
        dataTask.resume()
    }
    
    func fetchBreedImages(breedName: String, completionBlock: @escaping (Breed.LoadBreedImages.Response?) -> Void) {
        guard let url = URL(string: "https://dog.ceo/api/breed/\(breedName)/images") else {
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completionBlock(nil)
                return
            } else if let data = data, let response = try? JSONDecoder().decode(Breed.LoadBreedImages.Response.self, from: data) {
                completionBlock(response)
            } else {
                completionBlock(nil)
            }
        }
        
        dataTask.resume()
    }
    
}
