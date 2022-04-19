//
//  BreedImageViewCell.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 27-03-22.
//

import UIKit

class BreedImageViewCell: UICollectionViewCell {
    @IBOutlet weak var breedImage: UIImageView!
    
    static let imageCellId: String = "BreedImageViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: imageCellId, bundle: .main)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(with urlImage: String) {
        if let url = URL(string: urlImage) {
            breedImage.load(url: url)
        } else {
            breedImage.image = UIImage(named: "dog-default")
        }
        
    }

}
