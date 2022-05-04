//
//  BreedPresenter.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 25-03-22.
//

import Foundation

protocol BreedPresentationLogic {
    func attach(view: BreedDisplayLogic)
    func presentBreedImages(breedImage: BreedImage?)
    func presentBreedDetail(response: BreedModel.GoToBreedDetail.Response)
}

class BreedPresenter: BreedPresentationLogic {
    private let useCase: BreedImageUseCase
    private let viewModelMapper: Mapper<BreedDetail, BreedModel.GoToBreedDetail.Response>
    weak var view: BreedDisplayLogic?
    
    init(useCase: BreedImageUseCase, viewModelMapper: Mapper<BreedDetail, BreedModel.GoToBreedDetail.Response>) {
        self.useCase = useCase
        self.viewModelMapper = viewModelMapper
    }
    
    func attach(view: BreedDisplayLogic) {
        self.view = view
    }
    
    func presentBreedImages(breedImage: BreedImage?) {
        if let breedImage = breedImage {
            view?.displayBreedImages(viewModel: BreedModel.LoadBreedImages.ViewModel(images: breedImage.images))
        }
    }
    
    func presentBreedDetail(response: BreedModel.GoToBreedDetail.Response) {
        let viewModel = self.viewModelMapper.reverseMap(value: response)
        view?.displayBreedDetail(viewModel: viewModel)
    }
}
