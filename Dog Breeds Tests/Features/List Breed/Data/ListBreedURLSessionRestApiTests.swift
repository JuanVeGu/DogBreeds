//
//  ListBreedURLSessionRestApiTests.swift
//  Dog Breeds Tests
//
//  Created by mobdev on 20-04-22.
//

import XCTest
@testable import Dog_Breeds

class ListBreedURLSessionRestApiTests: XCTestCase {
    var sut: ListBreedURLSessionRestApi!
    
    override func setUp() {
        super.setUp()
        
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        
        sut = ListBreedURLSessionRestApi(urlSession: urlSession, url: "https://dog.ceo/api/breeds/list")
    }
    
    override func tearDown() {
        sut = nil
        MockURLProtocol.stubResponseData = nil
        MockURLProtocol.error = nil
        
        super.tearDown()
    }
    
    func test_WhenReceiveSuccessfullResponse_ReturnsResponseWithListBreed() {
        let expectation = expectation(description: "test_WhenReceiveSuccessfullResponse_ReturnsResponseWithListBreed")
        let stubResponseData = try? JSONEncoder().encode(Seeds.breedImageEntity)
        MockURLProtocol.stubResponseData = stubResponseData
        
        sut.fetchDogBreeds { response in
            XCTAssertNotNil(response)
            if let response = response {
                XCTAssertFalse(response.message.isEmpty)
            }
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    func test_WhenReceiveDifferentDataResponse_ReturnsNil() {
        let expectation = expectation(description: "test_WhenReceiveDifferentDataResponse_ReturnsNil")
        let stubResponseData = try? JSONEncoder().encode(Seeds.responseError)
        MockURLProtocol.stubResponseData = stubResponseData
        
        sut.fetchDogBreeds { response in
            XCTAssertNil(response)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    func test_WhenEmptyURLStringProvided_ReturnsNil() {
        let expectation = expectation(description: "test_WhenEmptyURLStringProvided_ReturnsNil")
        let stubResponseData = try? JSONEncoder().encode(Seeds.breedImageEntity)
        MockURLProtocol.stubResponseData = stubResponseData
        sut = ListBreedURLSessionRestApi(url: "")
        
        sut.fetchDogBreeds { response in
            XCTAssertNil(response)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    func test_WhenURLRequestFails_ReturnsNil() {
        let expectation = expectation(description: "test_WhenURLRequestFails_ReturnsNil")
        let errorDescription = "Internal Server Error"
        let error = NSError(domain: "", code: 500, userInfo: [NSLocalizedDescriptionKey: errorDescription])
        MockURLProtocol.error = error
        
        sut.fetchDogBreeds { response in
            XCTAssertNil(response)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
}
