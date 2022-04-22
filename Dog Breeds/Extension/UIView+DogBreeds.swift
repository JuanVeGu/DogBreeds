//
//  UIView+DogBreeds.swift
//  Dog Breeds
//
//  Created by mobdev on 21-04-22.
//

import UIKit

extension UIView {
    func addAutoLayout(_ subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
    }
}
