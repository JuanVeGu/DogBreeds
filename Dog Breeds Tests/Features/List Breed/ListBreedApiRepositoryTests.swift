//
//  ListBreedApiRepositoryTests.swift
//  Dog Breeds Tests
//
//  Created by mobdev on 19-04-22.
//

import XCTest
@testable import Dog_Breeds

class ListBreedApiRepositoryTests: XCTestCase {
    var sut: ListBreedApiRepository!
    var restApi: ListBreedRestApiMock!
    
    override func setUp() {
        super.setUp()
        restApi = ListBreedRestApiMock()
        sut = ListBreedApiRepository(listBreedRestApi: restApi, modelMapper: ListBreedEntityToListBreedModelMapper())
    }
    
    override func tearDown() {
        restApi = nil
        sut = nil
        super.tearDown()
    }
    
    func testListBreedShouldBeReturnNil() {
        let expectation = expectation(description: "testListBreedShouldBeReturnNil")
        restApi.shouldFail = true
        sut.fetchDogBreeds { list in
            XCTAssertNil(list)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    func testShouldBeReturnAListWithBreeds() {
        let expectation = expectation(description: "testShouldBeReturnAListWithBreeds")
        restApi.shouldFail = false
        sut.fetchDogBreeds { list in
            XCTAssertNotNil(list)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
}
