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
    var vcMock: ListBreedDisplayLogicMock!
    
    override func setUp() {
        super.setUp()
        sut = ListBreedPresenter(
            useCase: ListBreedUseCase(listBreedRepository: ListBreedRepositoryMock()),
            domainViewModelMapper: ListBreedDomainToListBreedViewModelMapper(),
            viewModelMapper: StringToBreedViewModelMapper()
        )
        
        vcMock = ListBreedDisplayLogicMock()
    }
    
    func testWhenViewIsAttached() {
        sut.attach(view: vcMock)
        XCTAssertNotNil(sut.view)
    }
    
    func testWhenUseCaseReturnAValidBreedListPresenterCallTheDisplayBreedsMethod() {
        sut.attach(view: vcMock)
        sut.presentDogBreeds()
        XCTAssertTrue(vcMock.didCallDisplayBreeds)
    }
    
    func testWhenAValidBreedIsPassedPresenterCalledDisplayBreedImages() {
        sut.attach(view: vcMock)
        sut.presentBreedImages(breedName: "schnauzer")
        XCTAssertTrue(vcMock.didCallDisplayBreedImages)
    }
    
    override func tearDown() {
        sut = nil
        vcMock = nil
        super.tearDown()
    }
}
