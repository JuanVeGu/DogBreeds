//
//  BreedDetailFactory.swift
//  Dog Breeds
//
//  Created by mobdev on 03-05-22.
//

import Foundation

class BreedDetailFactory {
    func viewController(_ type: BreedDetailFactoryType, _ detail: BreedDetail) -> BreedDetailViewController {
        switch type {
        case .detail:
            let view = BreedDetailViewController(
                dataSource: BreedDetailDataSource(),
                delegate: BreedDetailDelegate()
            )
            view.breedDetail = detail
            
            return view
        }
    }
}
