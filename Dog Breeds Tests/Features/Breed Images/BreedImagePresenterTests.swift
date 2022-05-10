//
//  BreedImagePresenter.swift
//  Dog Breeds Tests
//
//  Created by mobdev on 06-05-22.
//

import XCTest
@testable import Dog_Breeds

class BreedImagePresenterTests: XCTestCase {
    var sut: BreedImagePresenter!
    var vcMock: BreedImageDisplayLogicMock!
    var repository: BreedImageRepositoryMock!
    
    override func setUp() {
        super.setUp()
        repository = BreedImageRepositoryMock()
        sut = BreedImagePresenter(
            useCase: BreedImageUseCase(breedImageRepository: repository),
            domainToViewModelMapper: BreedImageDomainToBreedImageViewModelMapper(),
            viewModelMapper: ImageToBreedDetailViewModelMapper()
        )
        vcMock = BreedImageDisplayLogicMock()
    }
    
    override func tearDown() {
        sut = nil
        vcMock = nil
        repository = nil
        super.tearDown()
    }
    
    func testWhenViewIsAttached() {
        sut.attach(view: vcMock)
        XCTAssertNotNil(sut.view)
    }
    
    func testWhenBreedIsNotNilPresenterCalledDisplayBreedImagesMethod() {
        sut.attach(view: vcMock)
        sut.presentBreedImages(with: "schnauzer")
        XCTAssertTrue(vcMock.didCallDisplayBreedImages)
    }
    
    func testWhenBreedIsNotNil_ButUseCaseReturnNil_DisplayBreedImagesMethodIsNeverCalled() {
        repository.shouldFail = true
        sut.presentBreedImages(with: "schnauzer")
        XCTAssertFalse(vcMock.didCallDisplayBreedImages)
    }
    
    func testWhenBreedIsNilDisplayBreedImagesMethodIsNeverCalled() {
        sut.presentBreedImages(with: nil)
        XCTAssertFalse(vcMock.didCallDisplayBreedImages)
    }
    
    func testWhenAValidParametersIsPassedPresenterCalledDisplayBreedDetail() {
        sut.attach(view: vcMock)
        sut.presentBreedDetail(breedName: "", image: "")
        XCTAssertTrue(vcMock.didCallDisplayBreedDetail)
    }
}
