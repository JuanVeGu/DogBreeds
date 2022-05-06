//
//  BreedImageDelegateTests.swift
//  Dog Breeds Tests
//
//  Created by mobdev on 06-05-22.
//

import XCTest
@testable import Dog_Breeds

class BreedImageDelegateTests: XCTestCase {
    var sut: BreedImageDelegate!
    var vc: BreedImageViewController!
    var collectionView: UICollectionView!
    
    override func setUp() {
        super.setUp()
        sut = BreedImageDelegate()
        vc = ViewControllerFactory.viewController(type: .breedImagelist, breedName: "schnauzer")
        collectionView = vc.view.subviews[0] as? UICollectionView
    }
    
    func testWhenTheViewIsNilItDoesNothing() {
        sut.collectionView(collectionView, didSelectItemAt: IndexPath(row: 0, section: 0))
    }
    
    func testWhenTheViewExistItDoesSomething() {
        sut.view = vc
        vc.images = [""]
        sut.collectionView(collectionView, didSelectItemAt: IndexPath(row: 0, section: 0))
    }
    
    override func tearDown() {
        sut = nil
        vc = nil
        collectionView = nil
        super.tearDown()
    }
}
