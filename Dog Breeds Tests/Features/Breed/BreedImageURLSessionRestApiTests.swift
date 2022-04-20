//
//  BreedImageURLSessionRestApiTests.swift
//  Dog Breeds Tests
//
//  Created by mobdev on 20-04-22.
//

import XCTest
@testable import Dog_Breeds

class BreedImageURLSessionRestApiTests: XCTestCase {
    var sut: BreedImageURLSessionRestApi!

    override func setUp() {
        super.setUp()
        
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        
        sut = BreedImageURLSessionRestApi(urlSession: urlSession)
    }

    override func tearDown() {
        sut = nil
        MockURLProtocol.stubResponseData = nil
        MockURLProtocol.error = nil
        
        super.tearDown()
    }
    
    func test_WhenReceiveSuccessfullResponse_ReturnsResponseWithListImages() {
        let expectation = expectation(description: "test_WhenReceiveSuccessfullResponse_ReturnsResponseWithListImages")
        let stubResponseData = try? JSONEncoder().encode(Seeds.breedImages)
        MockURLProtocol.stubResponseData = stubResponseData
        
        sut.fetchBreedImages(breedName: "schnauzer") { response in
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
        
        sut.fetchBreedImages(breedName: "schnauzer") { response in
            XCTAssertNil(response)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    func test_WhenEmptyBreedNameProvided_ReturnsNil() {
        let expectation = expectation(description: "test_WhenEmptyBreedNameProvided_ReturnsNil")
        let stubResponseData = try? JSONEncoder().encode(Seeds.breedImages)
        MockURLProtocol.stubResponseData = stubResponseData
        
        sut.fetchBreedImages(breedName: "") { response in
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
        
        sut.fetchBreedImages(breedName: "schnauzer") { response in
            XCTAssertNil(response)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }

}
