//
//  StringToBreedViewModelMapperTests.swift
//  Dog Breeds Tests
//
//  Created by mobdev on 06-05-22.
//

import XCTest
@testable import Dog_Breeds

class StringToBreedViewModelMapperTests: XCTestCase {
    var sut: Mapper<Breed, String>!

    override func setUp() {
        super.setUp()
        sut = StringToBreedViewModelMapper()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testCompareMapper() {
        let string = Seeds.breedName
        let expectedViewModel = Breed(name: "schnauzer")
        
        let viewModel = sut.reverseMap(value: string)
        XCTAssertEqual(expectedViewModel, viewModel)
    }
    
}
