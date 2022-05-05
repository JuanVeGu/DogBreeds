//
//  BreedImageDelegate.swift
//  Dog Breeds
//
//  Created by mobdev on 05-05-22.
//

import UIKit

class BreedImageDelegate: NSObject {
    weak var view: BreedImageViewController?
}

extension BreedImageDelegate: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = view else { return }
        let urlImage = vc.images[indexPath.row]
        vc.presentBreedDetail(urlImage: urlImage)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
