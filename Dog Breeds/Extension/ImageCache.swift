//
//  ImageCache.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 27-03-22.
//

import UIKit

class ImageCache: UIImageView {
    var imageCache = NSCache<AnyObject, AnyObject>()
    
    var urlString: String?
    var dataTask: URLSessionDataTask?
    
    func load(urlImage: String) {
        if let imageFromCache = imageCache.object(forKey: urlImage as AnyObject) as? UIImage {
            self.setImage(with: imageFromCache)
            return
        }
        
        urlString = urlImage
        guard let url = URL(string: urlImage) else { return image = UIImage(named: "dog-default") }
        image = nil
        self.alpha = 0.0
        
        dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = try? Data(contentsOf: url), let image = UIImage(data: data) else {
                print("Couldn't load image from url: \(url)")
                return self.image = UIImage(named: "dog-default")
            }
            
            if self.urlString == urlImage {
                DispatchQueue.main.async {
                    self.setImage(with: image)
                    return
                }
            }
                            
            self.imageCache.setObject(image, forKey: urlImage as AnyObject)
        }
        
        dataTask?.resume()
    }
    
    private func setImage(with image: UIImage) {
        UIView.animate(withDuration: 0.4) {
            self.image = image
            self.alpha = 1.0
        }
    }
    
    func cancelLoadingImage() {
        dataTask?.cancel()
        dataTask = nil
    }
}
