//
//  BreedDetailDataSourceTests.swift
//  Dog Breeds Tests
//
//  Created by mobdev on 06-05-22.
//

import XCTest
@testable import Dog_Breeds

class BreedDetailDataSourceTests: XCTestCase {
    var sut: BreedDetailDataSource!
    var vc: BreedDetailViewController!
    var tableView: UITableView!
    
    override func setUp() {
        super.setUp()
        sut = BreedDetailDataSource()
        let breedDetail = BreedDetail(name: "", urlImage: "")
        vc = ViewControllerFactory.viewController(type: .detail, detail: breedDetail)
        tableView = vc.view.subviews[0] as? UITableView
    }
    
    func testTheNumberOfItemsIsGreaterThanZero() {
        let numberOfItems = sut.tableView(tableView, numberOfRowsInSection: 0)
        XCTAssertGreaterThan(numberOfItems, 0)
    }
    
    func testWhenViewIsNilReturnGenericCell() {
        let cell = sut.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertTrue((cell as Any) is UITableViewCell)
    }
    
    func testWhenViewExistReturnTitleViewCellForTheFirstRow() {
        sut.view = vc
        let index = BreedDetailCellType.allCases.firstIndex(of: .title)!
        let cell = sut.tableView(tableView, cellForRowAt: IndexPath(row: index, section: 0))
        
        XCTAssertTrue((cell as Any) is TitleViewCell)
    }
    
    func testWhenViewExistReturnImageViewCellForTheSecondRow() {
        sut.view = vc
        let index = BreedDetailCellType.allCases.firstIndex(of: .image)!
        let cell = sut.tableView(tableView, cellForRowAt: IndexPath(row: index, section: 0))
        
        XCTAssertTrue((cell as Any) is ImageViewCell)
    }
    
    func testWhenViewExistReturnDescriptionViewCellForThThirdRow() {
        sut.view = vc
        let index = BreedDetailCellType.allCases.firstIndex(of: .description)!
        let cell = sut.tableView(tableView, cellForRowAt: IndexPath(row: index, section: 0))
        
        XCTAssertTrue((cell as Any) is DescriptionViewCell)
    }
    
    override func tearDown() {
        sut = nil
        vc = nil
        tableView = nil
        super.tearDown()
    }
}
