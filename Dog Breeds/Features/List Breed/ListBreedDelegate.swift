//
//  ListBreedDelegate.swift
//  Dog Breeds
//
//  Created by mobdev on 04-05-22.
//

import UIKit

class ListBreedDelegate: NSObject {
    weak var view: ListBreedViewController?
}

extension ListBreedDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let view = view else { return }
        
        tableView.deselectRow(at: indexPath, animated: true)
        let breedName = view.breeds[indexPath.row]
        view.presentBreedImages(with: breedName)
    }
}
