//
//  BreedViewController.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 25-03-22.
//

import UIKit

protocol BreedDisplayLogic: AnyObject {
    func displayBreedImages(viewModel: BreedModel.LoadBreedImages.ViewModel)
    func displayBreedDetail(viewModel: BreedDetail)
}

class BreedViewController: UIViewController {
    private let imageCache = ImageCache()
    private let presenter: BreedPresentationLogic
    
    var breedName: String?
    
    var images: [String] = []
    
    private let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.itemSize = CGSize(width: 128, height: 128)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    init(presenter: BreedPresentationLogic) {
        self.presenter = presenter
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
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(BreedImageViewCell.self, forCellWithReuseIdentifier: BreedImageViewCell.cellId)
        view.addAutoLayout(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func fetchBreedImages() {
        let request = BreedModel.LoadBreedImages.Request(name: breedName)
//        interactor.loadBreedImages(request: request)
    }
}

extension BreedViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BreedImageViewCell.cellId, for: indexPath) as! BreedImageViewCell
        let urlImage = images[indexPath.row]
        self.imageCache.load(urlImage: urlImage) { image in
            cell.setup(with: image)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let urlImage = images[indexPath.row]
        let request = BreedModel.GoToBreedDetail.Request(name: title, urlImage: urlImage)
//        interactor.goToBreedDetail(request: request)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension BreedViewController: BreedDisplayLogic {
    func displayBreedImages(viewModel: BreedModel.LoadBreedImages.ViewModel) {
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
