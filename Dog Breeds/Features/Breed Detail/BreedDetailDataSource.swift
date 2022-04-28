//
//  BreedDetailDataSource.swift
//  Dog Breeds
//
//  Created by mobdev on 26-04-22.
//

import UIKit

class BreedDetailDataSource: NSObject {
    weak var viewController: BreedDetailViewController?
}

extension BreedDetailDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewController?.breedDetailList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BreedDetailViewCell.cellId, for: indexPath) as! BreedDetailViewCell
        if let vc = viewController {
            let breedDetail = vc.breedDetailList[indexPath.row]
            cell.setup(with: breedDetail)
        }
        
        return cell
    }
}
