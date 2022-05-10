//
//  BreedImageViewCell.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 27-03-22.
//

import UIKit

class BreedImageViewCell: UICollectionViewCell {
    static let cellId = String(describing: BreedImageViewCell.self)
    
    private let breedImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupComponents()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    private func setupComponents() {
        contentView.addAutoLayout(breedImage)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            breedImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            breedImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            breedImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            breedImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    func setup(with image: UIImage) {
        UIView.animate(withDuration: 0.2) {
            self.breedImage.image = image
            self.contentView.alpha = 1.0
        }
    }
    
    override func prepareForReuse() {
        contentView.alpha = 0.0
    }
}

