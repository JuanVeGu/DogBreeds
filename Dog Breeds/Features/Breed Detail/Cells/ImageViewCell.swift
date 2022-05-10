//
//  ImageViewCell.swift
//  Dog Breeds
//
//  Created by mobdev on 02-05-22.
//

import UIKit

class ImageViewCell: UITableViewCell {
    let breedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    static let cellId: String = String(describing: ImageViewCell.self)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupComponents()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    private func setupComponents() {
        contentView.addAutoLayout(breedImageView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            breedImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.45),
            breedImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.45),
            breedImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            breedImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0),
            breedImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10.0),
        ])
    }
    
    func setup(with urlImage: String) {
        breedImageView.load(urlImage: urlImage)
    }
}
