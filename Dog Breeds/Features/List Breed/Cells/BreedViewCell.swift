//
//  BreedViewCell.swift
//  Dog Breeds
//
//  Created by Juan Vergara Gutiérrez on 26-03-22.
//

import UIKit

class BreedViewCell: UITableViewCell {
    let breedName = UILabel()
    
    static let breedCellId = String(describing: BreedViewCell.self)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupComponents()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupComponents() {
        contentView.addAutoLayout(breedName)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            breedName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12.0),
            breedName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12.0),
            breedName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12.0),
            breedName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12.0),
        ])
    }
    
    func setup(with breed: String) {
        breedName.text = breed
    }
}
