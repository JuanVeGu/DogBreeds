//
//  BreedDetailDataSourceTests.swift
//  Dog Breeds Tests
//
//  Created by mobdev on 06-05-22.
//

import XCTest
@testable import Dog_Breeds

class BreedDetailDataSourceTests: XCTestCase {
    var sut: BreedDetailDataSource!
    
    override func setUp() {
        super.setUp()
        sut = BreedDetailDataSource()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
}
