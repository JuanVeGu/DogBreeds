//
//  BreedImageDomainToBreedImageViewModelMapperTests.swift
//  Dog Breeds Tests
//
//  Created by mobdev on 06-05-22.
//

import XCTest
@testable import Dog_Breeds

class BreedImageDomainToBreedImageViewModelMapperTests: XCTestCase {
    var sut: Mapper<BreedImageViewModel, BreedImageDomain>!
    
    override func setUp() {
        super.setUp()
        sut = BreedImageDomainToBreedImageViewModelMapper()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testCompareMappers() {
        let entity = Seeds.breedImageDomain
        let expectedModel = BreedImageViewModel(images: [
            "https://images.dog.ceo/breeds/hound-afghan/n02088094_1003.jpg",
            "https://images.dog.ceo/breeds/hound-afghan/n02088094_1007.jpg",
            "https://images.dog.ceo/breeds/hound-afghan/n02088094_1023.jpg",
            "https://images.dog.ceo/breeds/hound-afghan/n02088094_10263.jpg",
            "https://images.dog.ceo/breeds/hound-afghan/n02088094_10715.jpg",
            "https://images.dog.ceo/breeds/hound-afghan/n02088094_10822.jpg",
            "https://images.dog.ceo/breeds/hound-afghan/n02088094_10832.jpg",
            "https://images.dog.ceo/breeds/hound-afghan/n02088094_10982.jpg",
            "https://images.dog.ceo/breeds/hound-afghan/n02088094_11006.jpg",
        ])
        
        let model = sut.reverseMap(value: entity)
        
        XCTAssertEqual(expectedModel, model)
    }
}
