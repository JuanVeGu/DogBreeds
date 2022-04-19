//
//  BreedImageURLSessionRestApi.swift
//  Dog Breeds
//
//  Created by Mobdev 6 on 13-04-22.
//

import Foundation

class BreedImageURLSessionRestApi: BreedImageRestApi {
    private let urlSession: URLSession
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func fetchBreedImages(breedName: String, completionHandler: @escaping (Breed.LoadBreedImages.Response?) -> Void) {
        guard let url = URL(string: "https://dog.ceo/api/breed/\(breedName)/images") else {
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completionHandler(nil)
                return
            } else if let data = data, let response = try? JSONDecoder().decode(Breed.LoadBreedImages.Response.self, from: data) {
                completionHandler(response)
            } else {
                completionHandler(nil)
            }
        }
        
        dataTask.resume()
    }
}
