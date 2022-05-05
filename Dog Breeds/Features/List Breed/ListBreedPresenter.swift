//
//  DogBreedsPresenter.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 25-03-22.
//

import Foundation

protocol ListBreedPresentationLogic {
    func attach(view: ListBreedDisplayLogic)
    
    func presentDogBreeds()
    func presentBreedImages(breedName: String)
}

class ListBreedPresenter: ListBreedPresentationLogic {
    private let useCase: ListBreedUseCase
    private let domainViewModelMapper: Mapper<ListBreedViewModel, ListBreedDomain>
    private let viewModelMapper: Mapper<Breed, String>
    weak var view: ListBreedDisplayLogic?
    
    init(
        useCase: ListBreedUseCase,
        domainViewModelMapper: Mapper<ListBreedViewModel, ListBreedDomain>,
        viewModelMapper: Mapper<Breed, String>
    ) {
        self.useCase = useCase
        self.domainViewModelMapper = domainViewModelMapper
        self.viewModelMapper = viewModelMapper
    }
    
    func attach(view: ListBreedDisplayLogic) {
        self.view = view
    }
    
    func presentDogBreeds() {
        useCase.breeds { [self] listBreed in
            if let listBreed = listBreed {
                let viewModelMapper = self.domainViewModelMapper.reverseMap(value: listBreed)
                view?.displayBreeds(viewModel: viewModelMapper)
            }
        }
    }
    
    func presentBreedImages(breedName: String) {
        let viewModelMapper = self.viewModelMapper.reverseMap(value: breedName)
        view?.displayBreedImages(breed: viewModelMapper)
    }
}
