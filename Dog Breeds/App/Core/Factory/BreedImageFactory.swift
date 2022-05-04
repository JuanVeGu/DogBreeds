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
    
    func viewController(_ type: BreedImageFactoryType, _ breedName: String) -> BreedViewController {
        switch type {
        case .breedImagelist:
            let presenter = BreedPresenter(
                useCase: self.serviceLocator.breedUseCase,
                viewModelMapper: ImageToBreedDetailViewModelMapper()
            )
            
            let view = BreedViewController(
                presenter: presenter
            )
            
            view.title = breedName
            view.breedName = breedName
            
            return view
        }
    }
}
