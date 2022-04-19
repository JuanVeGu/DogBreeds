//
//  DogBreedsRouter.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 25-03-22.
//

import UIKit

@objc protocol ListBreedRoutingLogic {
    func routeToBreedImages()
}

protocol ListBreedDataPassing {
    var dataStore: ListBreedDataStore? { get }
}

class ListBreedRouter: NSObject, ListBreedRoutingLogic, ListBreedDataPassing {
    weak var viewController: ListBreedViewController?
    var dataStore: ListBreedDataStore?
    
    func routeToBreedImages() {
        if let viewController = viewController, let dataStore = viewController.router.dataStore, let breedName = dataStore.breedName {
            let destinationVC = BreedImageFactory(serviceLocator: BreedServiceLocator()).viewController(breedName: breedName)
            navigateToBreedImages(source: viewController, destination: destinationVC)
        }
    }
    
    // MARK: Navigation
    func navigateToBreedImages(source: ListBreedViewController, destination: BreedViewController) {
        source.show(destination, sender: nil)
    }
}
