//
//  BreedImageEntityToBreedImageModelTests.swift
//  Dog Breeds Tests
//
//  Created by mobdev on 20-04-22.
//

import XCTest
@testable import Dog_Breeds

class BreedImageEntityToBreedImageModelMapperTests: XCTestCase {
    var sut: Mapper<BreedImageDomain, BreedImageEntity>!
    
    override func setUp() {
        super.setUp()
        sut = BreedImageEntityToBreedImageDomainMapper()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testCompareMappers() {
        let entity = Seeds.breedImageEntity
        let expectedModel = BreedImageDomain(images: [
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
