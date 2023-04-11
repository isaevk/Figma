//
//  LatestCollectionViewCell.swift
//  Figma
//
//  Created by Kirill Dev on 03.04.2023.
//

import UIKit

final class LatestCollectionViewCell: UICollectionViewCell {
  
  // MARK: - Private Properties
  private let productImageView = UIImageView()
  private let categoryLabel = UILabel()
  private let nameProductLabel = UILabel()
  private let priceLabel = UILabel()
  private let addButton = UIButton()
  
  // MARK: Override Initializers
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
    setupConstraints()
  }
  
  @available(*, unavailable)
  required init? (coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Setup Constraints
  private func setupConstraints() {
    [productImageView, categoryLabel, nameProductLabel, priceLabel, addButton].forEach {
      addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      productImageView.topAnchor.constraint(equalTo: topAnchor),
      productImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
      productImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
      productImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
      productImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
      productImageView.widthAnchor.constraint(equalToConstant: 114),
      productImageView.heightAnchor.constraint(equalToConstant: 149),
      
      categoryLabel.widthAnchor.constraint(equalToConstant: 40),
      categoryLabel.heightAnchor.constraint(equalToConstant: 12),
      categoryLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
      categoryLabel.topAnchor.constraint(equalTo: topAnchor, constant: 80),
      
      nameProductLabel.widthAnchor.constraint(equalToConstant: 75),
      nameProductLabel.heightAnchor.constraint(equalToConstant: 14),
      nameProductLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
      nameProductLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 5),
      
      priceLabel.widthAnchor.constraint(equalToConstant: 45),
      priceLabel.heightAnchor.constraint(equalToConstant: 7),
      priceLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
      priceLabel.topAnchor.constraint(equalTo: bottomAnchor , constant: -15),
      
      addButton.widthAnchor.constraint(equalToConstant: 30),
      addButton.heightAnchor.constraint(equalToConstant: 30),
      addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0.1),
      addButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -0.2)
    ])
  }
  
  // MARK: Setup UI
  private func setupUI() {
    clipsToBounds = true
    
    productImageView.clipsToBounds = true
    productImageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    productImageView.layer.cornerRadius = 10
    productImageView.contentMode = .scaleAspectFill
    
    categoryLabel.font = .boldSystemFont(ofSize: 8)
    categoryLabel.textColor = .black
    categoryLabel.backgroundColor = .systemGray3
    categoryLabel.textAlignment = .center
    categoryLabel.layer.masksToBounds = true
    categoryLabel.layer.cornerRadius = 5
    
    nameProductLabel.textColor = .white
    nameProductLabel.font = .boldSystemFont(ofSize: 11)
    
    priceLabel.textColor = .label
    priceLabel.font = .boldSystemFont(ofSize: 8)
    priceLabel.textColor = .white
    
    addButton.setImage(UIImage(named: "small.plus"), for: .normal)
  }
}

// MARK: - Extension Self Configuring Cell
extension LatestCollectionViewCell: SelfConfiguringCell {
  static var reuseIdentifier = "LatestCell"
  
  // MARK: - Configuration
  func configure(with item: Item) {
    
    ImageDownloaderManager.shared.fetchImage(from: item.image_url) { result in
      switch result {
      case .success(let image):
        self.productImageView.image = image
      case .failure:
        self.productImageView.image = UIImage(named: "not.image")
      }
    }
    
    categoryLabel.text = item.category
    nameProductLabel.text = item.name
    priceLabel.text = "$ \(item.price)"
  }
}
