//
//  ImageCache.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 27-03-22.
//

import UIKit

class ImageCache {
    private let placeholdeImage = UIImage(named: "dog-default") ?? UIImage()
    private let cachedImages = NSCache<AnyObject, AnyObject>()
    
    func load(urlImage: String, completionHandler: @escaping (UIImage) -> Void) {
        if let cachedImage = image(urlImage: urlImage) {
            DispatchQueue.main.async {
                completionHandler(cachedImage)
            }
            return
        }
        
        let placeholderImage = UIImage(named: "dog-default") ?? UIImage()
        
        guard let url = URL(string: urlImage) else { return completionHandler(placeholderImage) }
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let responseData = data,
                  let image = UIImage(data: responseData), error == nil else {
                DispatchQueue.main.async {
                    completionHandler(placeholderImage)
                }
                
                return
            }
            
            self.cachedImages.setObject(image, forKey: urlImage as AnyObject, cost: responseData.count)
            DispatchQueue.main.async {
                completionHandler(image)
            }
        }
        
        dataTask.resume()
    }
    
    private final func image(urlImage: String) -> UIImage? {
        return cachedImages.object(forKey: urlImage as AnyObject) as? UIImage
    }
}
