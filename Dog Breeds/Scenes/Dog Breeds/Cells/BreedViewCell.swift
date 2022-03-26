//
//  BreedViewCell.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 26-03-22.
//

import UIKit

class BreedViewCell: UITableViewCell {
    @IBOutlet weak var breedName: UILabel!
    
    static let breedCellId: String = "BreedViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: breedCellId, bundle: .main)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(with breed: String) {
        breedName.text = breed
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
