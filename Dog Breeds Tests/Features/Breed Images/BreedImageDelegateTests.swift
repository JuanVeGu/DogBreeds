//
//  BreedImageDelegateTests.swift
//  Dog Breeds Tests
//
//  Created by mobdev on 06-05-22.
//

import XCTest
@testable import Dog_Breeds

class BreedImageDelegateTests: XCTestCase {
    var sut: BreedImageDelegate!
    
    override func setUp() {
        super.setUp()
        sut = BreedImageDelegate()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
}
