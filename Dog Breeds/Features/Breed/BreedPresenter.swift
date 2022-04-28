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
    func presentBreedDetail(response: Breed.GoToBreedDetail.Response)
}

class BreedPresenter: BreedPresentationLogic {
    weak var view: BreedDisplayLogic?
    private let viewModelMapper: Mapper<BreedDetail, Breed.GoToBreedDetail.Response>
    
    init(viewModelMapper: Mapper<BreedDetail, Breed.GoToBreedDetail.Response>) {
        self.viewModelMapper = viewModelMapper
    }
    
    func attach(view: BreedDisplayLogic) {
        self.view = view
    }
    
    func presentBreedImages(breedImage: BreedImage?) {
        if let breedImage = breedImage {
            view?.displayBreedImages(viewModel: Breed.LoadBreedImages.ViewModel(images: breedImage.images))
        }
    }
    
    func presentBreedDetail(response: Breed.GoToBreedDetail.Response) {
        let viewModel = self.viewModelMapper.reverseMap(value: response)
        view?.displayBreedDetail(viewModel: viewModel)
    }
}
