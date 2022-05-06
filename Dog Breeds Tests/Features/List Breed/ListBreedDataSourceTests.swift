//
//  ListBreedDataSourceTests.swift
//  Dog Breeds Tests
//
//  Created by mobdev on 06-05-22.
//

import XCTest
@testable import Dog_Breeds

class ListBreedDataSourceTests: XCTestCase {
    var sut: ListBreedDataSource!
    
    override func setUp() {
        super.setUp()
        sut = ListBreedDataSource()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
}
