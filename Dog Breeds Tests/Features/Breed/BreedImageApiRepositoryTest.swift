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
        sut = BreedImageApiRepository(breedImageRestApi: restApi, modelMapper: BreedImageEntityToBreedImageModel())
    }
    
    override func tearDown() {
        restApi = nil
        sut = nil
        super.tearDown()
    }
    
    func testFail() {
        let expectation = expectation(description: "testFail")
        restApi.shouldFail = true
        sut.fetchBreedImages(breedName: "") { images in
            XCTAssertNil(images)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    func testSuccess() {
        let expectation = expectation(description: "testSuccess")
        restApi.shouldFail = false
        sut.fetchBreedImages(breedName: "") { images in
            XCTAssertNotNil(images)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
}
