//
//  ListBreedPresenterTests.swift
//  Dog Breeds Tests
//
//  Created by mobdev on 06-05-22.
//

import XCTest
@testable import Dog_Breeds

class ListBreedPresenterTests: XCTestCase {
    var sut: ListBreedPresenter!
    
    override func setUp() {
        super.setUp()
        sut = ListBreedPresenter(
            useCase: ListBreedServiceLocator().listBreedUseCase,
            domainViewModelMapper: ListBreedDomainToListBreedViewModelMapper(),
            viewModelMapper: StringToBreedViewModelMapper()
        )
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
}
