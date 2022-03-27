//
//  DogBreedsWorker.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 25-03-22.
//

import Foundation

class DogBreedsWorker {
    private var urlSession: URLSession
    private var urlString: String
    
    init(urlString: String, urlSession: URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    func fetchDogBreeds(completionBlock: @escaping (DogBreeds.LoadDogBreeds.Response?) -> Void) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        let dataTask = urlSession.dataTask(with: url) { (data, response, error) in
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
    
}
