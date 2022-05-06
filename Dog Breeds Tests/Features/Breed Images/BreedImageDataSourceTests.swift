//
//  BreedImageDataSourceTests.swift
//  Dog Breeds Tests
//
//  Created by mobdev on 06-05-22.
//

import XCTest
@testable import Dog_Breeds

class BreedImageDataSourceTests: XCTestCase {
    var sut: BreedImageDataSource!
    
    override func setUp() {
        super.setUp()
        sut = BreedImageDataSource()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
}
