//
//  ListBreedViewControllerMock.swift
//  Dog Breeds Tests
//
//  Created by mobdev on 09-05-22.
//

import Foundation
@testable import Dog_Breeds

class ListBreedViewControllerMock: ListBreedViewController {
    var didCallPresentBreedImages = false
    
    override func presentBreedImages(with breedName: String) {
        didCallPresentBreedImages = true
    }
}
