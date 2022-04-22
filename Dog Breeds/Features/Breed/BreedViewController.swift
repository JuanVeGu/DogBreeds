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
    private let interactor: BreedBusinessLogic
    let router: (NSObjectProtocol & BreedRoutingLogic)
    
    var breedName: String?
    
    var images: [String] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    init(interactor: BreedBusinessLogic, router: (NSObjectProtocol & BreedRoutingLogic)) {
        self.interactor = interactor
        self.router = router
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor.attach(view: self)
        setupCollectionView()
        fetchBreedImages()
    }
    
    func setupCollectionView() {
        collectionView.register(BreedImageViewCell.nib(), forCellWithReuseIdentifier: BreedImageViewCell.imageCellId)
    }
    
    func fetchBreedImages() {
        let request = Breed.LoadBreedImages.Request(name: breedName)
        interactor.loadBreedImages(request: request)
    }

}

extension BreedViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
