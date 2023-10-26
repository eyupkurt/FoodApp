//
//  FoodCategoryCell.swift
//  FoodApp
//
//  Created by Eyüp Kurt on 26.10.2023.
//

import UIKit

class FoodCategoryCell: UICollectionViewCell {
    private let stackView = UIStackView()
    private let imageView = UIImageView()
    private let label = UILabel()

    static let reuseIdentifier = "FoodCategoryCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            imageView.widthAnchor.constraint(equalToConstant: 40),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
        ])
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
    }

    private func configure() {
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        stackView.spacing = 8
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        imageView.contentMode = .scaleAspectFit
    }

    func setup(item: FoodCategoryItem) {
        label.text = item.text
        imageView.image = UIImage(named: item.imageName)
    }
}

struct FoodCategoryItem {
    let text: String
    let imageName: String
}
