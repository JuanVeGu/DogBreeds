//
//  BreedImageApiRepositoryTest.swift
//  Dog Breeds Tests
//
//  Created by mobdev on 19-04-22.
//

import XCTest
@testable import Dog_Breeds

class BreedImageApiRepositoryTest: XCTestCase {
    var sut: BreedImageApiRepository!
    var restApi: BreedImageRestApiMock!
    
    override func setUp() {
        super.setUp()
        restApi = BreedImageRestApiMock()
        sut = BreedImageApiRepository(breedImageRestApi: restApi, modelMapper: BreedImageEntityToBreedImageDomainMapper())
    }
    
    override func tearDown() {
        restApi = nil
        sut = nil
        super.tearDown()
    }
    
    func testBreedImagesShouldBeReturnNil() {
        let expectation = expectation(description: "testBreedImagesShouldBeReturnNil")
        restApi.shouldFail = true
        sut.fetchBreedImages(breedName: "") { images in
            XCTAssertNil(images)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    func testShouldBeReturnAListWithImages() {
        let expectation = expectation(description: "testShouldBeReturnAListWithImages")
        restApi.shouldFail = false
        sut.fetchBreedImages(breedName: "") { images in
            XCTAssertNotNil(images)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
}
