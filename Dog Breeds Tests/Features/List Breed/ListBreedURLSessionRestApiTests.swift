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
        super.tearDown()
    }
    
    func test_WhenReceiveSuccessfullResponse_ReturnsResponseWithListBreed() {
        
    }
    
    func test_WhenReceiveDifferentDataResponse_ReturnsNil() {
        
    }
    
    func test_WhenEmptyURLStringProvided_ReturnsNil() {
        
    }
    
    func test_WhenURLRequestFails_ReturnsNil() {
        
    }
}
