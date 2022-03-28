//
//  BreedRouter.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 25-03-22.
//

import UIKit

@objc protocol BreedRoutingLogic { }

protocol BreedDataPassing {
    var dataStore: BreedDataStore? { get }
}

class BreedRouter: NSObject, BreedRoutingLogic, BreedDataPassing {
    weak var viewController: BreedViewController?
    var dataStore: BreedDataStore?
}
