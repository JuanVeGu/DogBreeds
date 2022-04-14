//
//  DogBreedsRouter.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 25-03-22.
//

import UIKit

@objc protocol DogBreedsRoutingLogic {
    func routeToBreedImages()
}

protocol DogBreedsDataPassing {
    var dataStore: DogBreedsDataStore? { get }
}

class DogBreedsRouter: NSObject, DogBreedsRoutingLogic, DogBreedsDataPassing {
    weak var viewController: DogBreedsViewController?
    var dataStore: DogBreedsDataStore?
    
    func routeToBreedImages() {
        if let viewController = viewController, let router = viewController.router, let dataStore = router.dataStore, let breedName = dataStore.breedName {
            let destinationVC = BreedViewController().configurator(breedName: breedName)
            navigateToBreedImages(source: viewController, destination: destinationVC)
        }
    }
    
    // MARK: Navigation
    func navigateToBreedImages(source: DogBreedsViewController, destination: BreedViewController) {
        source.show(destination, sender: nil)
    }
}
