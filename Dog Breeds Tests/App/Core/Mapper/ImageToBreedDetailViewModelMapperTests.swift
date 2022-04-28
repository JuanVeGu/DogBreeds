//
//  ImageToBreedDetailViewModelMapperTests.swift
//  Dog Breeds Tests
//
//  Created by mobdev on 28-04-22.
//

import XCTest
@testable import Dog_Breeds

class ImageToBreedDetailViewModelMapperTests: XCTestCase {
    var sut: ImageToBreedDetailViewModelMapper!

    override func setUp() {
        super.setUp()
        sut = ImageToBreedDetailViewModelMapper()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testCompareMapper() {
        let domain = Seeds.breedImageDetail
        let expectedViewModel = BreedDetail(
            name: "schnauzer",
            urlImage: "https://images.dog.ceo/breeds/hound-afghan/n02088094_1003.jpg"
        )
        let viewModel = sut.reverseMap(value: domain)
        XCTAssertEqual(expectedViewModel, viewModel)
    }
    
}
