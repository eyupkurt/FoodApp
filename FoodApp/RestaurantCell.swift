//
//  RestaurantCell.swift
//  FoodApp
//
//  Created by Eyüp Kurt on 26.10.2023.
//

import UIKit

class RestaurantCell: UITableViewCell {
    private let stackView = UIStackView()
    private let restaurantImageView = UIImageView()
    private let label = UILabel()
    
    static let reuseIdentifier = "RestaurantCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        
        stackView.addArrangedSubview(restaurantImageView)
        stackView.addArrangedSubview(label)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            //restaurantImageView.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            restaurantImageView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func configure() {
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.spacing = 8
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        restaurantImageView.contentMode = .scaleAspectFit
    }
    
    func setup(item: RestaurantItem) {
        label.text = item.name
        restaurantImageView.image = UIImage(named: item.imageName)
    }
}

struct RestaurantItem {
    let name: String
    let imageName: String
}
