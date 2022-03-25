//
//  DogBreedsConfigurator.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 24-03-22.
//

import UIKit

extension DogBreedsViewController {
    func configurator() -> UIViewController {
        let view = self
        let interactor = DogBreedsInteractor()
        let presenter = DogBreedsPresenter()
        view.interactor = interactor
        interactor.presenter = presenter
//        presenter.view = view
        return view
    }
}
