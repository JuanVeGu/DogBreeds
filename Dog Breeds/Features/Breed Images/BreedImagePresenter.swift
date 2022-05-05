//
//  BreedPresenter.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 25-03-22.
//

import Foundation

protocol BreedImagePresentationLogic {
    func attach(view: BreedImageDisplayLogic)
    func presentBreedImages(with breedName: String?)
    func presentBreedDetail(breedName: String?, image: String)
}

class BreedImagePresenter: BreedImagePresentationLogic {
    private let useCase: BreedImageUseCase
    private let domainToViewModelMapper: Mapper<BreedImageViewModel, BreedImageDomain>
    private let viewModelMapper: Mapper<BreedDetail, (String?, String)>
    weak var view: BreedImageDisplayLogic?
    
    init(
        useCase: BreedImageUseCase,
        domainToViewModelMapper: Mapper<BreedImageViewModel, BreedImageDomain>,
        viewModelMapper: Mapper<BreedDetail, (String?, String)>
    ) {
        self.useCase = useCase
        self.domainToViewModelMapper = domainToViewModelMapper
        self.viewModelMapper = viewModelMapper
    }
    
    func attach(view: BreedImageDisplayLogic) {
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
    
    func presentBreedDetail(breedName: String?, image: String) {
        let viewModel = self.viewModelMapper.reverseMap(value: (breedName, image))
        view?.displayBreedDetail(viewModel: viewModel)
    }
}
