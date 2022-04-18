//
//  DogBreedsConfigurator.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 24-03-22.
//

import UIKit

extension DogBreedsViewController {
    func configurator() -> DogBreedsViewController {
        let view = self
        let interactor = DogBreedsInteractor(
            useCase: ListBreedUseCase(
                listBreedRepository: ListBreedApiRepository(
                    listBreedRestApi: ListBreedURLSessionRestApi(url: "https://dog.ceo/api/breeds/list")
                )
            )
        )
        let presenter = DogBreedsPresenter()
        let router = DogBreedsRouter()
        view.interactor = interactor
        view.router = router
        interactor.presenter = presenter
        presenter.view = view
        router.viewController = view
        router.dataStore = interactor
        
        return view
    }
}
