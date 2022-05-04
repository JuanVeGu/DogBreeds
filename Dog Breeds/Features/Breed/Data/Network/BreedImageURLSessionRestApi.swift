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
    
    func fetchBreedImages(breedName: String, completionHandler: @escaping (BreedModel.LoadBreedImages.Response?) -> Void) {
        var urlString = ""
        if breedName.isEmpty == false {
            urlString = "https://dog.ceo/api/breed/\(breedName)/images"
        }
        
        guard let url = URL(string: urlString) else {
            return completionHandler(nil)
        }
        
        let dataTask = self.urlSession.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completionHandler(nil)
            } else if let data = data, let response = try? JSONDecoder().decode(BreedModel.LoadBreedImages.Response.self, from: data) {
                completionHandler(response)
            } else {
                completionHandler(nil)
            }
        }
        
        dataTask.resume()
    }
}
