//
//  ListBreedDataSourceTests.swift
//  Dog Breeds Tests
//
//  Created by mobdev on 06-05-22.
//

import XCTest
@testable import Dog_Breeds

class ListBreedDataSourceTests: XCTestCase {
    var sut: ListBreedDataSource!
    var vc: ListBreedViewController!
    var tableView: UITableView!
    
    override func setUp() {
        super.setUp()
        sut = ListBreedDataSource()
        vc = ViewControllerFactory.viewController(type: .breedList)
        tableView = vc.view.subviews[0] as? UITableView
    }
    
    func test_rowShowsCorrect() {
        vc.breeds = Seeds.listBreedViewModel.breed
        sut.view = vc
        
        let numberOfItems = sut.tableView(tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(numberOfItems, Seeds.listBreedViewModel.breed.count)
    }
    
    func testWhenTheViewIsNilReturnZeroRows() {
        let numberOfItems = sut.tableView(tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(numberOfItems, 0)
    }
    
    func testWhenViewIsNilReturnGenericCell() {
        let cell = sut.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertTrue((cell as Any) is UITableViewCell)
    }
    
    func testWhenExistViewReturnCustomCell() {
        vc.breeds = [""]
        sut.view = vc
        
        let cell = sut.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertTrue((cell as Any) is BreedViewCell)
    }
    
    override func tearDown() {
        sut = nil
        vc = nil
        tableView = nil
        super.tearDown()
    }
}
