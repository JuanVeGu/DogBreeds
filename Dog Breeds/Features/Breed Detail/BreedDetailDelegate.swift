//
//  BreedDetailDelegate.swift
//  Dog Breeds
//
//  Created by mobdev on 27-04-22.
//

import UIKit

class BreedDetailDelegate: NSObject {
    weak var viewController: BreedDetailViewController?
}

extension BreedDetailDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let vc = viewController, let breedDetail = vc.breedDetail, let breedName = breedDetail.name else { return }
        
        switch BreedDetailCellType.allCases[indexPath.row] {
        case .title:
            vc.presentAlert(title: "Title", message: "Breed \(breedName)")
        case .image:
            vc.presentAlert(title: "Image", message: "Breed \(breedName)")
        case .description:
            vc.presentAlert(title: "Description", message: "Breed \(breedName)")
        }
    }
}
