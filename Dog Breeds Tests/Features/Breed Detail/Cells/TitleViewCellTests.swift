//
//  TitleViewCellTests.swift
//  Dog Breeds Tests
//
//  Created by mobdev on 10-05-22.
//

import XCTest
@testable import Dog_Breeds

class TitleViewCellTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testCellIsNilWhenIsInitializedWithInitCoderMethod() {
        let sut = TitleViewCell(coder: NSCoder())
        XCTAssertNil(sut)
    }
}
