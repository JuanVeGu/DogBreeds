//
//  BreedDetailDelegateTests.swift
//  Dog Breeds Tests
//
//  Created by mobdev on 06-05-22.
//

import XCTest
@testable import Dog_Breeds

class BreedDetailDelegateTests: XCTestCase {
    var sut: BreedDetailDelegate!
    var vcMock: BreedDetailViewControllerMock!
    var tableView: UITableView!
    
    override func setUp() {
        super.setUp()
        sut = BreedDetailDelegate()
        vcMock = BreedDetailViewControllerMock(
            dataSource: BreedDetailDataSource(),
            delegate: sut
        )
        vcMock.breedDetail = Seeds.breedDetail
        tableView = vcMock.view.subviews[0] as? UITableView
    }
    
    func testWhenViewExistAndTheTitleRowIsSelectedPresentAlertIsCalled() {
        let index = BreedDetailCellType.allCases.firstIndex(of: .title)!
        sut.tableView(tableView, didSelectRowAt: IndexPath(row: index, section: 0))
        XCTAssertTrue(vcMock.didCallPresentAlert)
    }
    
    func testWhenViewExistAndTheImageRowIsSelectedPresentAlertIsCalled() {
        let index = BreedDetailCellType.allCases.firstIndex(of: .image)!
        sut.tableView(tableView, didSelectRowAt: IndexPath(row: index, section: 0))
        XCTAssertTrue(vcMock.didCallPresentAlert)
    }
    
    func testWhenViewExistAndTheDescriptionRowIsSelectedPresentAlertIsCalled() {
        let index = BreedDetailCellType.allCases.firstIndex(of: .description)!
        sut.tableView(tableView, didSelectRowAt: IndexPath(row: index, section: 0))
        XCTAssertTrue(vcMock.didCallPresentAlert)
    }
    
    func testWhenViewIsNilPresentAlertIsNeverCalled() {
        sut.view = nil
        let index = BreedDetailCellType.allCases.firstIndex(of: .image)!
        sut.tableView(tableView, didSelectRowAt: IndexPath(row: index, section: 0))
        XCTAssertFalse(vcMock.didCallPresentAlert)
    }
    
    override func tearDown() {
        sut = nil
        vcMock = nil
        super.tearDown()
    }
}
