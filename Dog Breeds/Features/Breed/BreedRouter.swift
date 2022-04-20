//
//  BreedRouter.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 25-03-22.
//

import UIKit

@objc protocol BreedRoutingLogic { }

class BreedRouter: NSObject, BreedRoutingLogic {
    weak var viewController: BreedViewController?
}
