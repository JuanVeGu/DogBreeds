//
//  BreedDetailDelegateTests.swift
//  Dog Breeds Tests
//
//  Created by mobdev on 06-05-22.
//

import XCTest
@testable import Dog_Breeds

class BreedDetailDelegateTests: XCTestCase {
    var sut: BreedDetailDelegate!
    
    override func setUp() {
        super.setUp()
        sut = BreedDetailDelegate()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
}
