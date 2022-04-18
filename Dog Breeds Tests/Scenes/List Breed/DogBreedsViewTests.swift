//
//  DogBreedsViewTests.swift
//  Dog Breeds Tests
//
//  Created by Juan Vergara Gutiérrez on 25-03-22.
//

import XCTest
@testable import Dog_Breeds

class DogBreedsViewTests: XCTestCase {
    var sut: ListBreedViewController!
    var interactorSpy: DogBreedsInteractorSpy!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ListBreedViewController()
        interactorSpy = DogBreedsInteractorSpy()
    }
    
    func testShouldLoadDogBreeds() {
        // given
        sut.interactor = interactorSpy
        // when
        sut.fetchDogBreeds()
        // then
        XCTAssert(interactorSpy.loadDogBreedsCalled, "fetchDogBreeds() should ask the interactor to load the dog breeds")
    }

    override func tearDownWithError() throws {
        sut = nil
        interactorSpy = nil
        try super.tearDownWithError()
    }

}
