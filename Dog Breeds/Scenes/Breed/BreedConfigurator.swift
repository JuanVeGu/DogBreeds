//
//  BreedConfigurator.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 25-03-22.
//

import UIKit

extension BreedViewController {
    func configurator(breedName: String) -> BreedViewController {
        let view = self
        view.title = breedName
        
        let interactor = BreedInteractor(
            useCase: BreedImageUseCase(
                breedName: breedName,
                breedImageRepository: BreedImageApiRepository(
                    breedImageRestApi: BreedRestApi(url: "https://dog.ceo/api/breed/\(breedName)/images")
                )
            )
        )
        let presenter = BreedPresenter()
        let router = BreedRouter()
        view.interactor = interactor
        view.router = router
        interactor.presenter = presenter
        presenter.view = view
        router.viewController = view
        
        return view
    }
}
