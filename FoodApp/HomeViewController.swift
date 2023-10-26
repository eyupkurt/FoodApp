//
//  ViewController.swift
//  FoodApp
//
//  Created by Eyüp Kurt on 26.10.2023.
//

import UIKit

class HomeViewController: UIViewController {

    private let mainStackView = UIStackView()
    private let topStackView = UIStackView()
    private let greetingLabel = UILabel()
    private let shoppingButton = UIButton()

    private let collectionViewLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        layout.minimumInteritemSpacing = 0.0
        return layout
    }()

    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
    
    private let tableView = UITableView()

    private var categoryItems: [FoodCategoryItem] = [
        FoodCategoryItem(text: "Italian", imageName: "category1"),
        FoodCategoryItem(text: "French", imageName: "category2"),
        FoodCategoryItem(text: "American", imageName: "category3"),
        FoodCategoryItem(text: "Turkish", imageName: "category4"),
        FoodCategoryItem(text: "Iranian", imageName: "category5"),
        FoodCategoryItem(text: "Italian", imageName: "category6"),
        FoodCategoryItem(text: "Italian", imageName: "category7")
    ]
    
    private var restaurantItems: [RestaurantItem] = [
        RestaurantItem(name: "Italian", imageName: "category1"),
        RestaurantItem(name: "French", imageName: "category2"),
        RestaurantItem(name: "American", imageName: "category3"),
        RestaurantItem(name: "Turkish", imageName: "category4"),
        RestaurantItem(name: "Iranian", imageName: "category5"),
        RestaurantItem(name: "Italian", imageName: "category6"),
        RestaurantItem(name: "Italian", imageName: "category7")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        layout()
        configure()
    }

    private func layout() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(mainStackView)

        mainStackView.addArrangedSubview(topStackView)
        mainStackView.addArrangedSubview(collectionView)
        mainStackView.addArrangedSubview(tableView)

        topStackView.addArrangedSubview(greetingLabel)
        topStackView.addArrangedSubview(shoppingButton)

        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            mainStackView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            collectionView.heightAnchor.constraint(equalToConstant: 80),
            topStackView.heightAnchor.constraint(equalToConstant: 60),
            tableView.heightAnchor.constraint(equalToConstant: 600)
        ])
    }

    private func configure() {
        view.backgroundColor = .systemBackground

        mainStackView.alignment = .fill
        mainStackView.distribution = .equalSpacing
        mainStackView.axis = .vertical
        
        topStackView.axis = .horizontal
        topStackView.distribution = .equalSpacing
        
        greetingLabel.text = "Günaydın, Ali"
        greetingLabel.textColor = .label
                
        let image = UIImage(systemName: "basket")
        shoppingButton.setImage(image, for: .normal)
        shoppingButton.tintColor = .systemGray

        collectionView.register(FoodCategoryCell.self, forCellWithReuseIdentifier: FoodCategoryCell.reuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        tableView.register(RestaurantCell.self, forCellReuseIdentifier: RestaurantCell.reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodCategoryCell.reuseIdentifier, for: indexPath) as? FoodCategoryCell else {
            return UICollectionViewCell()
        }
        
        cell.setup(item: categoryItems[indexPath.item])

        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    
}
 
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantCell.reuseIdentifier, for: indexPath) as? RestaurantCell else {
            return UITableViewCell()
        }

        cell.setup(item: restaurantItems[indexPath.item])

        return cell
    }
}
