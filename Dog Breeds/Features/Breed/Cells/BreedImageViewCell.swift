//
//  BreedImageViewCell.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 27-03-22.
//

import UIKit

class BreedImageViewCell: UICollectionViewCell {
    @IBOutlet weak var breedImage: ImageCache!
    
    static let imageCellId = String(describing: BreedImageViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: imageCellId, bundle: .main)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(with urlImage: String) {
        breedImage.load(urlImage: urlImage)
    }
    
    override func prepareForReuse() {
        breedImage.cancelLoadingImage()
    }
}
