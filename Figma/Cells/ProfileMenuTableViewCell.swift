//
//  ProfileMenuTableViewCell.swift
//  Figma
//
//  Created by Kirill Dev on 24.03.2023.
//

import UIKit

final class ProfileMenuTableViewCell: UITableViewCell {

  private let symbolImageView = UIImageView()
  private let discriptionLabel = UILabel()
  
  
  
  
  // MARK: - Override Initializers
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
//    setupUI()
//    setupConstraints()
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
