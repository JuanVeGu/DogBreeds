//
//  ListBreedDataSource.swift
//  Dog Breeds
//
//  Created by mobdev on 25-04-22.
//

import UIKit

class ListBreedDataSource: NSObject {
    weak var view: ListBreedViewController?
}

extension ListBreedDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let view = view else { return 0 }
        return view.breeds.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let view = view else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: BreedViewCell.breedCellId, for: indexPath) as! BreedViewCell
        
        let breed = view.breeds[indexPath.row]
        cell.setup(with: breed)
        
        return cell
    }
}
