//
//  ListBreedEntityToListBreedModelMapperTests.swift
//  Dog Breeds Tests
//
//  Created by mobdev on 20-04-22.
//

import XCTest
@testable import Dog_Breeds

class ListBreedEntityToListBreedModelMapperTests: XCTestCase {
    var sut: Mapper<ListBreed, ListBreeds.LoadDogBreeds.Response>!
    
    override func setUp() {
        super.setUp()
        sut = ListBreedEntityToListBreedModelMapper()
    }
    
    func testCompareMappers() {
        let entity = Seeds.dogBreedsResponse
        let expectedModel = ListBreed(breed: [
            "affenpinscher",
            "african",
            "airedale",
            "akita",
            "appenzeller",
            "australian",
            "basenji",
            "beagle",
            "bluetick",
            "borzoi",
        ])
        let model = sut.reverseMap(value: entity)
        
        XCTAssertEqual(expectedModel, model)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
}