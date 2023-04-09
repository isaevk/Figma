//
//  SaleCollectionViewCell.swift
//  Figma
//
//  Created by Kirill Dev on 03.04.2023.
//

import UIKit

final class SaleCollectionViewCell: UICollectionViewCell {
    
  // MARK: - Private Properties
  private let productImageView = UIImageView()
  private let discountLabel = UILabel()
  private let nameProductLabel = UILabel()
  private let categoryLabel = UILabel()
  private let priceLabel = UILabel()
  private let likeButton = UIButton()
  private let addButton = UIButton()
  
  // MARK: - Override Initializer
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupConstraints()
    setupUI()
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Setup Constraints
  private func setupConstraints() {
    [productImageView, discountLabel, nameProductLabel, categoryLabel, priceLabel, likeButton, addButton].forEach {
      addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      productImageView.topAnchor.constraint(equalTo: topAnchor),
      productImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
      productImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
      productImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
      productImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
      productImageView.widthAnchor.constraint(equalToConstant: 174),
      productImageView.heightAnchor.constraint(equalToConstant: 221),
      
      discountLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
      discountLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
      discountLabel.widthAnchor.constraint(equalToConstant: 49),
      discountLabel.heightAnchor.constraint(equalToConstant: 18),

      categoryLabel.widthAnchor.constraint(equalToConstant: 40),
      categoryLabel.heightAnchor.constraint(equalToConstant: 15),
      categoryLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
      categoryLabel.topAnchor.constraint(equalTo: topAnchor, constant: 115),

      nameProductLabel.widthAnchor.constraint(equalToConstant: 180),
      nameProductLabel.heightAnchor.constraint(equalToConstant: 18),
      nameProductLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
      nameProductLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 5),

      priceLabel.widthAnchor.constraint(equalToConstant: 40),
      priceLabel.heightAnchor.constraint(equalToConstant: 10),
      priceLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
      priceLabel.bottomAnchor.constraint(equalTo:bottomAnchor , constant: -15),

      likeButton.widthAnchor.constraint(equalToConstant: 33),
      likeButton.heightAnchor.constraint(equalToConstant: 33),
      likeButton.rightAnchor.constraint(equalTo: addButton.leftAnchor, constant: -2),
      likeButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2.5),

      addButton.widthAnchor.constraint(equalToConstant: 40),
      addButton.heightAnchor.constraint(equalToConstant: 40),
      addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0.1),
      addButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -0.2)
    ])
  }
  
  // MARK: - Setup UI
  private func setupUI() {
    clipsToBounds = true
    productImageView.clipsToBounds = true
    productImageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    productImageView.layer.cornerRadius = 10
    productImageView.contentMode = .scaleAspectFill
    
    discountLabel.backgroundColor = .systemRed
    discountLabel.font = .boldSystemFont(ofSize: 12)
    discountLabel.textColor = .white
    discountLabel.textAlignment = .center
    discountLabel.layer.masksToBounds = true
    discountLabel.layer.cornerRadius = 5
    
    categoryLabel.font = .boldSystemFont(ofSize: 10)
    categoryLabel.textColor = .black
    categoryLabel.backgroundColor = .systemGray3
    categoryLabel.textAlignment = .center
    categoryLabel.layer.masksToBounds = true
    categoryLabel.layer.cornerRadius = 5
    
    nameProductLabel.textColor = .white
    nameProductLabel.font = .boldSystemFont(ofSize: 16)

    priceLabel.textColor = .systemGray5
    priceLabel.font = .boldSystemFont(ofSize: 12)

    addButton.setImage(UIImage(named: "big.plus"), for: .normal)
    likeButton.setImage(UIImage(named: "small.like"), for: .normal)
  }
}

// MARK: - Extension SelfConfiguringCell
extension SaleCollectionViewCell: SelfConfiguringCell {
  static var reuseIdentifier = "SaleCell"
  
  // MARK: - Configuration
  func configure(with item: Item) {
    ImageDownloaderManager.shared.fetchImage(from: item.image_url)  { (image) in
      self.productImageView.image = image
    }
    
    guard let discount = item.discount else { return }
    discountLabel.text = "\(String(describing: discount))% off"
    categoryLabel.text = item.category
    nameProductLabel.text = item.name
    priceLabel.text = "$ \(item.price)"
  }
}
