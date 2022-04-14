//
//  ListBreedRestApi.swift
//  Dog Breeds
//
//  Created by Mobdev 6 on 13-04-22.
//

import Foundation

class ListBreedRestApi: ListBreedRestApiProtocol {
    private let urlSession: URLSession
    private let url: String
    
    init(urlSession: URLSession = .shared, url: String) {
        self.urlSession = urlSession
        self.url = url
    }
    
    func fetchDogBreeds(completionHandler: @escaping (ListBreed.LoadDogBreeds.Response?) -> Void) {
        guard let url = URL(string: self.url) else {
            return
        }
        
        let dataTask = self.urlSession.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completionHandler(nil)
                return
            } else if let data = data, let response = try? JSONDecoder().decode(ListBreed.LoadDogBreeds.Response.self, from: data) {
                completionHandler(response)
            } else {
                completionHandler(nil)
            }
        }
        
        dataTask.resume()
    }
}
