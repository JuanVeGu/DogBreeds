//
//  ListBreedFactory.swift
//  Dog Breeds
//
//  Created by Mobdev 6 on 18-04-22.
//

import Foundation

class ListBreedFactory {
    private let serviceLocator: ListBreedServiceLocator
    
    init(serviceLocator: ListBreedServiceLocator) {
        self.serviceLocator = serviceLocator
    }
    
    func viewController(_ type: ListBreedFactoryType) -> ListBreedViewController {
        switch type {
        case .breedList:
            let router = ListBreedRouter()
            
            let interactor = ListBreedInteractor(
                presenter: ListBreedPresenter(),
                useCase: self.serviceLocator.listBreedUseCase
            )
            
            let view = ListBreedViewController(
                interactor: interactor,
                router: router
            )
            view.title = "Dog Breeds"
            
            router.viewController = view
            router.dataStore = interactor
            
            return view
        }
    }
}
