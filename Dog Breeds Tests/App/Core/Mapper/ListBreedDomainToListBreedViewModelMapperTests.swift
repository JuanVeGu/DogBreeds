//
//  ListBreedDomainToListBreedViewModelMapperTests.swift
//  Dog Breeds Tests
//
//  Created by mobdev on 06-05-22.
//

import XCTest
@testable import Dog_Breeds

class ListBreedDomainToListBreedViewModelMapperTests: XCTestCase {
    var sut: Mapper<ListBreedViewModel, ListBreedDomain>!
    
    override func setUp() {
        super.setUp()
        sut = ListBreedDomainToListBreedViewModelMapper()
    }
    
    override func tearDown() {
        sut = nil
        super.setUp()
    }
    
    func testCompareMappers() {
        let entity = Seeds.listBreedDomain
        let expectedModel = ListBreedViewModel(breed: [
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
}
