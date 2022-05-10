//
//  ListBreedUseCaseTests.swift
//  Dog Breeds Tests
//
//  Created by mobdev on 20-04-22.
//

import XCTest
@testable import Dog_Breeds

class ListBreedUseCaseTests: XCTestCase {
    var sut: ListBreedUseCase!
    var repository: ListBreedRepositoryMock!
    
    override func setUp() {
        super.setUp()
        repository = ListBreedRepositoryMock()
        sut = ListBreedUseCase(listBreedRepository: repository)
    }
    
    override func tearDown() {
        repository = nil
        sut = nil
        super.tearDown()
    }
    
    func testListBreedShouldBeReturnNil() {
        let expectation = expectation(description: "testListBreedShouldBeReturnNil")
        
        repository.shouldFail = true
        
        sut.breeds { listBreed in
            XCTAssertNil(listBreed)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    func testShouldBeReturnAListWithBreeds() {
        let expectation = expectation(description: "testShouldBeReturnAListWithBreeds")
        repository.shouldFail = false
        
        sut.breeds { listBreed in
            XCTAssertNotNil(listBreed)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
}
