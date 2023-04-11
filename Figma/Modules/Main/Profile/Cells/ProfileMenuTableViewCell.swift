//
//  ProfileMenuTableViewCell.swift
//  Figma
//
//  Created by Kirill Dev on 24.03.2023.
//

import UIKit

final class ProfileMenuTableViewCell: UITableViewCell {
  
  // MARK: - Public Properties
  lazy var balanceLabel = UILabel()
  
  // MARK: - Private Properties
  private let symbolImageView = UIImageView()
  private let discriptionLabel = UILabel()
  private let arrowImageView = UIImageView()
  
  // MARK: - Override Initializer
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
    setupConstraints()
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: Setup Constraints
  private func setupConstraints() {
    [symbolImageView, discriptionLabel, arrowImageView, balanceLabel].forEach {
      contentView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate( [
      symbolImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      symbolImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
      discriptionLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      discriptionLabel.leftAnchor.constraint(equalTo: symbolImageView.leftAnchor, constant: 60),
      arrowImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      arrowImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -35),
      balanceLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      balanceLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -35)
    ])
  }
  
  // MARK: - Setup UI
  private func setupUI() {
    selectionStyle = .none
    backgroundColor = UIColor(hex: "#FAF9FFFF")
    discriptionLabel.font = .boldSystemFont(ofSize: 14)
  }
  
  // MARK: - Configuration
  func configuration(menuCell: MenuCell) {
    symbolImageView.image = menuCell.symbol
    discriptionLabel.text = menuCell.name
    arrowImageView.image = menuCell.pointer == true ? Symbol.arrow : nil
    balanceLabel.text =  menuCell.name == "Balance" ? NameCell.balanceSum : nil
  }
}
