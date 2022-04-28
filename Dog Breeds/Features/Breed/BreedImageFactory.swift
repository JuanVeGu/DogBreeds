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
    
    func viewController(breedName: String) -> BreedViewController {
        let router = BreedRouter()
        
        let view = BreedViewController(
            interactor: BreedInteractor(
                presenter: BreedPresenter(viewModelMapper: ImageToBreedDetailViewModelMapper()),
                useCase: self.serviceLocator.breedUseCase
            ),
            router: router
        )
        view.title = breedName
        view.breedName = breedName
        
        router.viewController = view
        
        return view
    }
}
