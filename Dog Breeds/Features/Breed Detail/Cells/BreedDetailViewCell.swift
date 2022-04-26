//
//  BreedDetailViewCell.swift
//  Dog Breeds
//
//  Created by mobdev on 26-04-22.
//

import UIKit

class BreedDetailViewCell: UITableViewCell {
    private let containerView = UIView()
    
    private let breedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let breedNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0, weight: .semibold)
        return label
    }()
    
    private let breedDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12.0, weight: .light)
        label.textAlignment = .justified
        label.numberOfLines = 4
        return label
    }()
    
    static let cellId: String = String(describing: BreedDetailViewCell.self)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupComponents()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupComponents() {
        contentView.addAutoLayout(containerView)
        containerView.addAutoLayout(breedImageView)
        containerView.addAutoLayout(breedNameLabel)
        containerView.addAutoLayout(breedDescriptionLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.0),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4.0),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4.0),
            
            breedImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            breedImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            breedImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            breedImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            breedImageView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.2),
            
            breedNameLabel.leadingAnchor.constraint(equalTo: breedImageView.trailingAnchor, constant: 5.0),
            breedNameLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            breedNameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            breedDescriptionLabel.leadingAnchor.constraint(equalTo: breedImageView.trailingAnchor, constant: 5.0),
            breedDescriptionLabel.topAnchor.constraint(equalTo: breedNameLabel.bottomAnchor, constant: 5.0),
            breedDescriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            breedDescriptionLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
        ])
    }
    
    func setup(with image: UIImage) {
        self.breedImageView.load(urlImage: "https://images.dog.ceo/breeds/schnauzer-giant/n02097130_1070.jpg")
        self.breedNameLabel.text = "BreedName"
        self.breedDescriptionLabel.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
    }
}
