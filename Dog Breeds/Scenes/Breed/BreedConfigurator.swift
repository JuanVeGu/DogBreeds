//
//  BreedConfigurator.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 25-03-22.
//

import UIKit

extension BreedViewController {
    func configurator() -> UIViewController {
        let view = self
        let interactor = BreedInteractor()
        let presenter = BreedPresenter()
        view.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
