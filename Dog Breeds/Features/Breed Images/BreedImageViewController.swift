//
//  BreedViewController.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 25-03-22.
//

import UIKit

protocol BreedImageDisplayLogic: AnyObject {
    func displayBreedImages(viewModel: BreedImageViewModel)
    func displayBreedDetail(viewModel: BreedDetail)
}

class BreedImageViewController: UIViewController {
    private let imageCache = ImageCache()
    private let presenter: BreedImagePresentationLogic
    private let dataSource: BreedImageDataSource
    private let delegate: BreedImageDelegate
    
    var breedName: String?
    
    var images: [String] = []
    
    private let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.itemSize = CGSize(width: 128, height: 128)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    init(
        presenter: BreedImagePresentationLogic,
        dataSource: BreedImageDataSource,
        delegate: BreedImageDelegate
    ) {
        self.presenter = presenter
        self.dataSource = dataSource
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.attach(view: self)
        prepareCollectionView()
        fetchBreedImages()
    }
    
    func prepareCollectionView() {
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
        collectionView.register(BreedImageViewCell.self, forCellWithReuseIdentifier: BreedImageViewCell.cellId)
        view.addAutoLayout(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        dataSource.view = self
        delegate.view = self
    }
    
    func fetchBreedImages() {
        presenter.presentBreedImages(with: breedName)
    }
    
    internal func loadImage(urlImage: String, completionHandler: @escaping (UIImage) -> Void) {
        imageCache.load(urlImage: urlImage) { image in
            completionHandler(image)
        }
    }
    
    internal func presentBreedDetail(urlImage: String) {
        presenter.presentBreedDetail(breedName: title, image: urlImage)
    }
}

extension BreedImageViewController: BreedImageDisplayLogic {
    func displayBreedImages(viewModel: BreedImageViewModel) {
        DispatchQueue.main.async {
            self.images = viewModel.images
            self.collectionView.reloadData()
        }
    }
    
    func displayBreedDetail(viewModel: BreedDetail) {
        let vc = ViewControllerFactory.viewController(type: .detail, detail: viewModel)
        self.navigationController?.changePrefersLargeTitles(with: false)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
