//
//  ListBreedDelegateTests.swift
//  Dog Breeds Tests
//
//  Created by mobdev on 06-05-22.
//

import XCTest
@testable import Dog_Breeds

class ListBreedDelegateTests: XCTestCase {
    var sut: ListBreedDelegate!
    
    override func setUp() {
        super.setUp()
        sut =  ListBreedDelegate()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
}
