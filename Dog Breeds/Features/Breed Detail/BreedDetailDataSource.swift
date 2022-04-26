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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BreedDetailViewCell.cellId, for: indexPath) as! BreedDetailViewCell
        cell.setup(with: UIImage())
        return cell
    }
}
