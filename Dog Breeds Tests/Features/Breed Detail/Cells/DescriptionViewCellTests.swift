//
//  DescriptionViewCellTests.swift
//  Dog Breeds Tests
//
//  Created by mobdev on 10-05-22.
//

import XCTest
@testable import Dog_Breeds

class DescriptionViewCellTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testCellIsNilWhenIsInitializedWithInitCoderMethod() {
        let sut = DescriptionViewCell(coder: NSCoder())
        XCTAssertNil(sut)
    }
}
