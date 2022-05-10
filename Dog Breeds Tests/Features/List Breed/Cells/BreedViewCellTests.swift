//
//  BreedViewCellTests.swift
//  Dog Breeds Tests
//
//  Created by mobdev on 10-05-22.
//

import XCTest
@testable import Dog_Breeds

class BreedViewCellTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func testCellIsNilWhenIsInitializedWithInitCoderMethod() {
        let sut = BreedViewCell(coder: NSCoder())
        XCTAssertNil(sut)
    }
}
