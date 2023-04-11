//
//  SectionHeader.swift
//  Figma
//
//  Created by Kirill Dev on 04.04.2023.
//

import UIKit

final class SectionHeader: UICollectionReusableView {
  static let reuseIdentifier = "SectionHeader"
  
  // MARK: - Public Properties
  var titleLabel = UILabel()
  
  // MARK: - Private Properties
  private let viewAllLabel = UILabel()
  
  // MARK: - Override Initializer
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI() 
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Setup UI
  private func setupUI() {
    titleLabel.textColor = .label
    titleLabel.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 20, weight: .bold))
    viewAllLabel.text = "View all"
    viewAllLabel.textColor = UIColor(hex: "#808080FF")
    viewAllLabel.font = .systemFont(ofSize: 8)
    
    let stackView = UIStackView(arrangedSubviews: [titleLabel, viewAllLabel])
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .horizontal
    addSubview(stackView)
    
    NSLayoutConstraint.activate([
      stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
      stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
      stackView.topAnchor.constraint(equalTo: topAnchor),
      stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
    ])
    
    stackView.setCustomSpacing(10, after: titleLabel)
  }
}
