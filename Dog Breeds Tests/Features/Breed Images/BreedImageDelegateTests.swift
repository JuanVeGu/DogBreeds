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
    var vcMock: BreedImageViewControllerMock!
    var collectionView: UICollectionView!
    
    override func setUp() {
        super.setUp()
        sut = BreedImageDelegate()
        
        vcMock = BreedImageViewControllerMock(
            presenter: BreedImagePresenter(
                useCase: BreedServiceLocator().breedUseCase,
                domainToViewModelMapper: BreedImageDomainToBreedImageViewModelMapper(),
                viewModelMapper: ImageToBreedDetailViewModelMapper()
            ),
            dataSource: BreedImageDataSource(),
            delegate: sut
        )
        
        collectionView = vcMock.view.subviews[0] as? UICollectionView
    }
    
    override func tearDown() {
        sut = nil
        vcMock = nil
        collectionView = nil
        super.tearDown()
    }
    
    func testWhenTheViewExistAndAnItemIsSelectedTheBreedDetailViewIsDisplayed() {
        sut.view = vcMock
        vcMock.images = [""]
        sut.collectionView(collectionView, didSelectItemAt: IndexPath(row: 0, section: 0))
        XCTAssertTrue(vcMock.didCallPresentBreedDetail)
    }
    
    func testWhenViewIsNilAndARowIsSelectedPresentBreedDetailIsNeverCalled() {
        sut.view = nil
        sut.collectionView(collectionView, didSelectItemAt: IndexPath(row: 0, section: 0))
        XCTAssertFalse(vcMock.didCallPresentBreedDetail)
    }
}
