//
//  DogBreedsPresenterTests.swift
//  Dog Breeds Tests
//
//  Created by Juan Vergara Gutiérrez on 25-03-22.
//

import XCTest
@testable import Dog_Breeds

class DogBreedsPresenterTests: XCTestCase {
    var sut: ListBreedPresenter!
    var viewSpy: DogBreedsViewSpy!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ListBreedPresenter()
        viewSpy = DogBreedsViewSpy()
    }
    
    func testPresentFetchedDogBreedsShouldAskViewControllerToDisplayFetchedBreeds() {
        // given
        sut.view = viewSpy
        // when
        let response = Seeds.dogBreedsResponse
        sut.presentDogBreeds(response: response)
        // then
        XCTAssert(viewSpy.viewDogBreedsCalled, "Presenting fetched breeds should ask view controller to display them")
    }

    override func tearDownWithError() throws {
        sut = nil
        viewSpy = nil
        try super.tearDownWithError()
    }

}
