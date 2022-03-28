//
//  BreedViewController.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 25-03-22.
//

import UIKit

protocol BreedDisplayLogic: AnyObject {
    func displayBreedImages(viewModel: Breed.LoadBreedImages.ViewModel)
}

class BreedViewController: UIViewController {
    var interactor: BreedBusinessLogic?
    var images: [String] = []
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "schnauzer"
        
        setupCollectionView()
        fetchBreedImages()
    }
    
    func setupCollectionView() {
        collectionView.register(BreedImageViewCell.nib(), forCellWithReuseIdentifier: BreedImageViewCell.imageCellId)
    }
    
    func fetchBreedImages() {
        let request = Breed.LoadBreedImages.Request(breedName: "schnauzer")
        interactor?.loadBreedImages(request: request)
    }

}

extension BreedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BreedImageViewCell.imageCellId, for: indexPath) as! BreedImageViewCell
        let urlImage = images[indexPath.row]
        cell.setup(with: urlImage)
        
        return cell
    }
    
}

extension BreedViewController: BreedDisplayLogic {
    func displayBreedImages(viewModel: Breed.LoadBreedImages.ViewModel) {
        DispatchQueue.main.async {
            self.images = viewModel.images
            self.collectionView.reloadData()
        }
    }
    
}
