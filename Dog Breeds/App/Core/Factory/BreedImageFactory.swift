//
//  BreedImageFactory.swift
//  Dog Breeds
//
//  Created by mobdev on 19-04-22.
//

import Foundation

class BreedImageFactory {
    private let serviceLocator: BreedServiceLocator
    
    init(serviceLocator: BreedServiceLocator) {
        self.serviceLocator = serviceLocator
    }
    
    func viewController(_ type: BreedImageFactoryType, _ breedName: String) -> BreedImageViewController {
        switch type {
        case .breedImagelist:
            let presenter = BreedImagePresenter(
                useCase: self.serviceLocator.breedUseCase,
                domainToViewModelMapper: BreedImageDomainToBreedImageViewModelMapper(),
                viewModelMapper: ImageToBreedDetailViewModelMapper()
            )
            
            let view = BreedImageViewController(
                presenter: presenter,
                dataSource: BreedImageDataSource(),
                delegate: BreedImageDelegate()
            )
            
            view.title = breedName
            view.breedName = breedName
            
            return view
        }
    }
}
