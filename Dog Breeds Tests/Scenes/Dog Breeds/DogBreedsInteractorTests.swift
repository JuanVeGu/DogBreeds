//
//  DogBreedsInteractorTests.swift
//  Dog Breeds Tests
//
//  Created by Juan Vergara Gutiérrez on 25-03-22.
//

import XCTest
@testable import Dog_Breeds

class DogBreedsInteractorTests: XCTestCase {
    var sut: DogBreedsInteractor!
    var presenterSpy: DogBreedsPresenterSpy!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = DogBreedsInteractor()
        presenterSpy = DogBreedsPresenterSpy()
    }
    
    func testLoadDogBreedsCallsToPresenterDogBreeds() {
        // given
        sut.presenter = presenterSpy
        let response = Seeds.dogBreedsResponse
        let dogBreedsWorker = DogBreedsWorkerSpy(urlString: "https://dog.ceo/api/breeds/list")
        sut.worker = dogBreedsWorker
        // when
        let request = DogBreeds.LoadDogBreeds.Request()
        sut.loadDogBreeds(request: request)
        // then
        XCTAssert(dogBreedsWorker.fetchDogBreedsCalled, "fetchDogBreeds() was not called")
        XCTAssert(presenterSpy.presentDogBreedsCalled, "presentDogBreeds() was not called")
        XCTAssertEqual(presenterSpy.dogBreeds, response.message, "loadDogBreeds(request:) should ask the presenter to present the same dog breeds data it loaded")
    }

    override func tearDownWithError() throws {
        sut = nil
        presenterSpy = nil
        try super.tearDownWithError()
    }

}
