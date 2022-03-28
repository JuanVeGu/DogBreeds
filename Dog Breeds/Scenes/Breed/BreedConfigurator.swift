//
//  BreedConfigurator.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 25-03-22.
//

import UIKit

extension BreedViewController {
    func configurator() -> BreedViewController {
        let view = self
        let interactor = BreedInteractor()
        let presenter = BreedPresenter()
        let router = BreedRouter()
        view.interactor = interactor
        view.router = router
        interactor.presenter = presenter
        presenter.view = view
        router.viewController = view
        router.dataStore = interactor
        
        return view
    }
}
