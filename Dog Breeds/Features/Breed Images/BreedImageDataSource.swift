//
//  BreedImageDataSource.swift
//  Dog Breeds
//
//  Created by mobdev on 05-05-22.
//

import UIKit

class BreedImageDataSource: NSObject {
    weak var view: BreedImageViewController?
}

extension BreedImageDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let vc = view else { return 0 }
        return vc.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let vc = view else { return UICollectionViewCell() }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BreedImageViewCell.cellId, for: indexPath) as! BreedImageViewCell
        let urlImage = vc.images[indexPath.row]
        vc.loadImage(urlImage: urlImage) { image in
            cell.setup(with: image)
        }
        
        return cell
    }
}
