//
//  BreedImageUseCaseTests.swift
//  Dog Breeds Tests
//
//  Created by mobdev on 20-04-22.
//

import XCTest
@testable import Dog_Breeds

class BreedImageUseCaseTests: XCTestCase {
    var sut: BreedImageUseCase!
    var repository: BreedImageRepositoryMock!
    
    override func setUp() {
        super.setUp()
        repository = BreedImageRepositoryMock()
        sut = BreedImageUseCase(breedImageRepository: repository)
    }
    
    func testBreedImagesShouldBeReturnNil() {
        let expectation = expectation(description: "testBreedImagesShouldBeReturnNil")
        
        repository.shouldFail = true
        
        sut.fetchBreedImages(breedName: "") { breedImage in
            XCTAssertNil(breedImage)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    func testShouldBeReturnAListWithImages() {
        let expectation = expectation(description: "testShouldBeReturnAListWithImages")
        repository.shouldFail = false
        
        sut.fetchBreedImages(breedName: "") { breedImage in
            XCTAssertNotNil(breedImage)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }

    override func tearDown() {
        repository = nil
        sut = nil
        super.tearDown()
    }
}
