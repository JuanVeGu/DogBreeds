//
//  BreedViewTests.swift
//  Dog Breeds Tests
//
//  Created by Juan Vergara Gutiérrez on 27-03-22.
//

import XCTest
@testable import Dog_Breeds

class BreedViewTests: XCTestCase {
    var sut: BreedViewController!
    var interactorSpy: BreedInteractorSpy!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = BreedViewController()
        interactorSpy = BreedInteractorSpy()
    }
    
    func testShouldLoadBreedImages() {
        // given
        sut.interactor = interactorSpy
        // when
        sut.fetchBreedImages()
        // then
        XCTAssert(interactorSpy.loadBreedImagesCalled)
    }

    override func tearDownWithError() throws {
        sut = nil
        interactorSpy = nil
        try super.tearDownWithError()
    }

}
