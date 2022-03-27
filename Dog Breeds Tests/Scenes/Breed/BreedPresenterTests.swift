//
//  BreedPresenterTests.swift
//  Dog Breeds Tests
//
//  Created by Juan Vergara Gutiérrez on 27-03-22.
//

import XCTest
@testable import Dog_Breeds

class BreedPresenterTests: XCTestCase {
    var sut: BreedPresenter!
    var viewSpy: BreedViewSpy!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = BreedPresenter()
        viewSpy = BreedViewSpy()
    }
    
    func testPresentFetchedBreedImagesShouldAskViewControllerToDisplayFetchedImages() {
        // given
        sut.view = viewSpy
        // when
        let response = Seeds.breedImages
        sut.presentBreedImages(response: response)
        // then
        XCTAssert(viewSpy.displayBreedImagesCalled, "Presenting fetched images should ask view controller to display them")
    }

    override func tearDownWithError() throws {
        sut = nil
        viewSpy = nil
        try super.tearDownWithError()
    }

}
