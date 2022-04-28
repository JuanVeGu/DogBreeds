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
        guard let vc = viewController else { return }
        let breedDetail = vc.breedDetailList[indexPath.row]
        vc.presentAlert(title: "DogBreed", message: breedDetail.name)
    }
}
