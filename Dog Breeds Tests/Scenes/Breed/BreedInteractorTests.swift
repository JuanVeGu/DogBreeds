//
//  BreedInteractorTests.swift
//  Dog Breeds Tests
//
//  Created by Juan Vergara Gutiérrez on 27-03-22.
//

import XCTest
@testable import Dog_Breeds

class BreedInteractorTests: XCTestCase {
    var sut: BreedInteractor!
    var presenterSpy: BreedPresenterSpy!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = BreedInteractor()
        presenterSpy = BreedPresenterSpy()
    }

    func testLoadBreedImagesCallsToPresenterBreedImages() {
        // given
        sut.presenter = presenterSpy
        let response = Seeds.breedImages
        let dogBreedsWorker = DogBreedsWorkerSpy()
        sut.worker = dogBreedsWorker
        // when
        let request = Breed.LoadBreedImages.Request()
        sut.breedName = "schnauzer"
        sut.loadBreedImages(request: request)
        // then
        XCTAssert(dogBreedsWorker.fetchBreedImagesCalled, "fetchBreedImages() was not called")
        XCTAssert(presenterSpy.presentBreedImagesCalled, "presentBreedImages() was not called")
        XCTAssertEqual(presenterSpy.images, response.message, "loadDogBreeds(request:) should ask the presenter to present the same dog breeds data it loaded")
    }

    override func tearDownWithError() throws {
        sut = nil
        presenterSpy = nil
        try super.tearDownWithError()
    }

}
