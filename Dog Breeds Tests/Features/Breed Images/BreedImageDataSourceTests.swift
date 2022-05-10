//
//  BreedImageDataSourceTests.swift
//  Dog Breeds Tests
//
//  Created by mobdev on 06-05-22.
//

import XCTest
@testable import Dog_Breeds

class BreedImageDataSourceTests: XCTestCase {
    var sut: BreedImageDataSource!
    var vc: BreedImageViewController!
    var collectionView: UICollectionView!
    
    override func setUp() {
        super.setUp()
        sut = BreedImageDataSource()
        vc = ViewControllerFactory.viewController(type: .breedImagelist, breedName: "schnauzer")
        collectionView = vc.view.subviews[0] as? UICollectionView
    }
    
    override func tearDown() {
        sut = nil
        vc = nil
        collectionView = nil
        super.tearDown()
    }
    
    func test_rowShowsCorrect() {
        vc.images = Seeds.breedImageViewModel.images
        sut.view = vc
        
        let numberOfItems = sut.collectionView(collectionView, numberOfItemsInSection: 0)
        XCTAssertEqual(numberOfItems, Seeds.breedImageViewModel.images.count)
    }
    
    func testWhenTheViewIsNilReturnZeroRows() {
        let numberOfItems = sut.collectionView(collectionView, numberOfItemsInSection: 0)
        XCTAssertEqual(numberOfItems, 0)
    }
    
    func testWhenViewIsNilReturnGenericCell() {
        let cell = sut.collectionView(collectionView, cellForItemAt: IndexPath(row: 0, section: 0))
        XCTAssertTrue((cell as Any) is UICollectionViewCell)
    }
    
    func testWhenExistViewReturnCustomCell() {
        vc.images = [""]
        sut.view = vc
        
        let cell = sut.collectionView(collectionView, cellForItemAt: IndexPath(row: 0, section: 0))
        XCTAssertTrue((cell as Any) is BreedImageViewCell)
    }
}
