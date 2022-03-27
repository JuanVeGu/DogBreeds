//
//  BreedViewController.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 25-03-22.
//

import UIKit

class BreedViewController: UIViewController {
    var interactor: BreedBusinessLogic?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func fetchBreedImages() {
        let request = Breed.LoadBreedImages.Request(breedName: "schnauzer")
        interactor?.loadBreedImages(request: request)
    }

}
