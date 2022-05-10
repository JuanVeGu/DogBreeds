//
//  ImageViewCellTests.swift
//  Dog Breeds Tests
//
//  Created by mobdev on 10-05-22.
//

import XCTest
@testable import Dog_Breeds

class ImageViewCellTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testCellIsNilWhenIsInitializedWithInitCoderMethod() {
        let sut = ImageViewCell(coder: NSCoder())
        XCTAssertNil(sut)
    }
}
