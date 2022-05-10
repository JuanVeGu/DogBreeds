//
//  BreedImageViewControllerMock.swift
//  Dog Breeds Tests
//
//  Created by mobdev on 06-05-22.
//

import Foundation
@testable import Dog_Breeds

class BreedImageViewControllerMock: BreedImageViewController {
    var didCallPresentBreedDetail = false
    
    override func presentBreedDetail(urlImage: String) {
        didCallPresentBreedDetail = true
    }
}
