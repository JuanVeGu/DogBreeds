//
//  ViewControllerFactory.swift
//  Dog Breeds
//
//  Created by mobdev on 03-05-22.
//

import UIKit

class ViewControllerFactory {
    private static let listBreedServiceLocator = ListBreedServiceLocator()
    private static let breedServiceLocator = BreedServiceLocator()
    
    class func viewController(type: ListBreedFactoryType) -> ListBreedViewController {
        let view = ListBreedFactory(serviceLocator: listBreedServiceLocator)
        return view.viewController(type)
    }
    
    class func viewController(type: BreedImageFactoryType, breedName: String) -> BreedImageViewController {
        let view = BreedImageFactory(serviceLocator: breedServiceLocator)
        return view.viewController(type, breedName)
    }
    
    class func viewController(type: BreedDetailFactoryType, detail: BreedDetail) -> BreedDetailViewController {
        let view = BreedDetailFactory()
        return view.viewController(type, detail)
    }
}
