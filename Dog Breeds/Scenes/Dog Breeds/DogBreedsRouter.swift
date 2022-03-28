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
        let destinationVC = BreedViewController().configurator()
        var destinationDS = destinationVC.router!.dataStore!
        passDataToBreedImages(source: dataStore!, destination: &destinationDS)
        navigateToBreedImages(source: viewController!, destination: destinationVC)
    }
    
    // MARK: Navigation
    func navigateToBreedImages(source: DogBreedsViewController, destination: BreedViewController) {
        source.show(destination, sender: nil)
    }
    
    // MARK: Passing data
    func passDataToBreedImages(source: DogBreedsDataStore, destination: inout BreedDataStore) {
        destination.breedName = source.breedName
    }
}
