//
//  TitleViewCell.swift
//  Dog Breeds
//
//  Created by mobdev on 02-05-22.
//

import UIKit

class TitleViewCell: UITableViewCell {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30.0, weight: .semibold)
        return label
    }()
    
    static let cellId: String = String(describing: TitleViewCell.self)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupComponents()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupComponents() {
        contentView.addAutoLayout(titleLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5.0),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5.0)
        ])
    }
    
    func setup(with title: String?) {
        titleLabel.text = title
    }
}
