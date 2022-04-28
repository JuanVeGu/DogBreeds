//
//  UIImageView+DogBreeds.swift
//  Dog Breeds
//
//  Created by mobdev on 26-04-22.
//

import UIKit

extension UIImageView {
    func load(urlImage: String) {
        let placeholderImage = UIImage(named: "dog-default") ?? UIImage()
        guard let url = URL(string: urlImage) else { return self.image = placeholderImage }
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
