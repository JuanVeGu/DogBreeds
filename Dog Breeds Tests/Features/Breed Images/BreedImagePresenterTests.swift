//
//  BreedImagePresenter.swift
//  Dog Breeds Tests
//
//  Created by mobdev on 06-05-22.
//

import XCTest
@testable import Dog_Breeds

class BreedImagePresenterTests: XCTestCase {
    var sut: BreedImagePresenter!
    
    override func setUp() {
        super.setUp()
        sut = BreedImagePresenter(
            useCase: BreedServiceLocator().breedUseCase,
            domainToViewModelMapper: BreedImageDomainToBreedImageViewModelMapper(),
            viewModelMapper: ImageToBreedDetailViewModelMapper()
        )
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
}
