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
            let presenter = ListBreedPresenter(
                useCase: self.serviceLocator.listBreedUseCase,
                domainViewModelMapper: ListBreedDomainToListBreedViewModelMapper(),
                viewModelMapper: StringToBreedViewModelMapper()
            )
            
            let view = ListBreedViewController(
                presenter: presenter,
                dataSource: ListBreedDataSource(),
                delegate: ListBreedDelegate()
            )
            view.title = "Dog Breeds"
            
            return view
        }
    }
}
