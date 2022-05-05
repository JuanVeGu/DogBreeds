//
//  BreedPresenter.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 25-03-22.
//

import Foundation

protocol BreedPresentationLogic {
    func attach(view: BreedDisplayLogic)
    func presentBreedImages(with breedName: String?)
    func presentBreedDetail(response: BreedModel.GoToBreedDetail.Response)
}

class BreedPresenter: BreedPresentationLogic {
    private let useCase: BreedImageUseCase
    private let domainToViewModelMapper: Mapper<BreedImageViewModel, BreedImageDomain>
    private let viewModelMapper: Mapper<BreedDetail, BreedModel.GoToBreedDetail.Response>
    weak var view: BreedDisplayLogic?
    
    init(
        useCase: BreedImageUseCase,
        domainToViewModelMapper: Mapper<BreedImageViewModel, BreedImageDomain>,
        viewModelMapper: Mapper<BreedDetail, BreedModel.GoToBreedDetail.Response>
    ) {
        self.useCase = useCase
        self.domainToViewModelMapper = domainToViewModelMapper
        self.viewModelMapper = viewModelMapper
    }
    
    func attach(view: BreedDisplayLogic) {
        self.view = view
    }
    
    func presentBreedImages(with breedName: String?) {
        guard let breedName = breedName else { return }
        
        useCase.fetchBreedImages(breedName: breedName) { [self] breedImage in
            guard let breedImage = breedImage else { return }
            let viewModel = self.domainToViewModelMapper.reverseMap(value: breedImage)
            view?.displayBreedImages(viewModel: viewModel)
        }
    }
    
    func presentBreedDetail(response: BreedModel.GoToBreedDetail.Response) {
        let viewModel = self.viewModelMapper.reverseMap(value: response)
        view?.displayBreedDetail(viewModel: viewModel)
    }
}
