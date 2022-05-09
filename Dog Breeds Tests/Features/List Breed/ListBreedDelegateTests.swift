//
//  ListBreedDelegateTests.swift
//  Dog Breeds Tests
//
//  Created by mobdev on 06-05-22.
//

import XCTest
@testable import Dog_Breeds

class ListBreedDelegateTests: XCTestCase {
    var sut: ListBreedDelegate!
    var vcMock: ListBreedViewControllerMock!
    var tableView: UITableView!
    
    override func setUp() {
        super.setUp()
        sut =  ListBreedDelegate()
        
        vcMock = ListBreedViewControllerMock(
            presenter: ListBreedPresenter(
                useCase: ListBreedServiceLocator().listBreedUseCase,
                domainViewModelMapper: ListBreedDomainToListBreedViewModelMapper(),
                viewModelMapper: StringToBreedViewModelMapper()
            ),
            dataSource: ListBreedDataSource(),
            delegate: sut
        )
        
        tableView = vcMock.view.subviews[0] as? UITableView
    }
    
    func testWhenTheViewExistAndARowIsSelectedTheBreedImageViewIsDisplayed() {
        sut.view = vcMock
        vcMock.breeds = [""]
        sut.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        XCTAssertTrue(vcMock.didCallPresentBreedImages)
    }
    
    func testWhenViewIsNilAndARowIsSelectedPresentBreedImagesIsNeverCalled() {
        sut.view = nil
        sut.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        XCTAssertFalse(vcMock.didCallPresentBreedImages)
    }
    
    override func tearDown() {
        sut = nil
        vcMock = nil
        super.tearDown()
    }
}
