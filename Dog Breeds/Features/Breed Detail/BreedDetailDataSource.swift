//
//  BreedDetailDataSource.swift
//  Dog Breeds
//
//  Created by mobdev on 26-04-22.
//

import UIKit

class BreedDetailDataSource: NSObject {
    weak var view: BreedDetailViewController?
}

extension BreedDetailDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BreedDetailCellType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let vc = view, let breedDetail = vc.breedDetail else { return UITableViewCell() }
        
        switch BreedDetailCellType.allCases[indexPath.row] {
        case .title:
            let cell = tableView.dequeueReusableCell(withIdentifier: TitleViewCell.cellId, for: indexPath) as! TitleViewCell
            cell.setup(with: breedDetail.name)
            return cell
        case .image:
            let cell = tableView.dequeueReusableCell(withIdentifier: ImageViewCell.cellId, for: indexPath) as! ImageViewCell
            cell.setup(with: breedDetail.urlImage)
            return cell
        case .description:
            let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionViewCell.cellId, for: indexPath) as! DescriptionViewCell
            cell.setup()
            return cell
        }
    }
}
