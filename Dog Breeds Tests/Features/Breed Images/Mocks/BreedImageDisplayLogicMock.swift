//
//  BreedImageDisplayLogicMock.swift
//  Dog Breeds Tests
//
//  Created by mobdev on 09-05-22.
//

import Foundation
@testable import Dog_Breeds

class BreedImageDisplayLogicMock: BreedImageDisplayLogic {
    var didCallDisplayBreedImages = false
    var didCallDisplayBreedDetail = false
    
    func displayBreedImages(viewModel: BreedImageViewModel) {
        didCallDisplayBreedImages = true
    }
    
    func displayBreedDetail(viewModel: BreedDetail) {
        didCallDisplayBreedDetail = true
    }
}
