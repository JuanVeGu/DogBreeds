//
//  BreedImageViewCellTests.swift
//  Dog Breeds Tests
//
//  Created by mobdev on 10-05-22.
//

import XCTest
@testable import Dog_Breeds

class BreedImageViewCellTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testCellIsNilWhenIsInitializedWithInitCoderMethod() {
        let sut = BreedImageViewCell(coder: NSCoder())
        XCTAssertNil(sut)
    }
}
