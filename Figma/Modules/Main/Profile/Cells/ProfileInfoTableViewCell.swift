//
//  ProfileInfoTableViewCell.swift
//  Figma
//
//  Created by Kirill Dev on 23.03.2023.
//

import UIKit

final class ProfileInfoTableViewCell: UITableViewCell {
  
  // MARK: - Internal Properties
  
  var showPickerViewController: (() -> Void)?
  
  let avatarImageView: UIImageView = {
    let avatar = UIImageView()
    avatar.layer.cornerRadius = 26
    avatar.contentMode = .scaleAspectFill
    avatar.clipsToBounds = true
    avatar.layer.borderWidth = 1.5
    avatar.layer.borderColor = UIColor.systemGray.cgColor
    return avatar
  }()
  
  // MARK: - Private Properties
  private let changePhotoButton: UIButton = {
    let changePhoto = UIButton()
    changePhoto.setTitle("Change photo", for: .normal)
    changePhoto.titleLabel?.font = .systemFont(ofSize: 7)
    changePhoto.setTitleColor(.systemGray, for: .normal)
    return changePhoto
  }()
  
  private let fullNameLabel: UILabel = {
    let name = UILabel()
    name.font = .boldSystemFont(ofSize: 18)
    name.textAlignment = .center
    return name
  }()
  
  private let uploadItemButton = UIButton()
  
  // MARK: - Override Initializers
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
    setupConstraints()
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - IBAction
  @objc private func actionChangePhoto() {
    self.showPickerViewController?()
  }
  
  // MARK: - Setup Constraints
  private func setupConstraints() {
    [avatarImageView, changePhotoButton, fullNameLabel, uploadItemButton].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview($0)
    }
    
    NSLayoutConstraint.activate([
      avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
      avatarImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      avatarImageView.widthAnchor.constraint(equalToConstant: 60),
      avatarImageView.heightAnchor.constraint(equalToConstant: 60),
      
      changePhotoButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 5),
      changePhotoButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      changePhotoButton.heightAnchor.constraint(equalToConstant: 8),
      changePhotoButton.widthAnchor.constraint(equalToConstant: 56),
      
      fullNameLabel.topAnchor.constraint(equalTo: changePhotoButton.bottomAnchor, constant: 8),
      fullNameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      fullNameLabel.widthAnchor.constraint(equalToConstant: 100),
      fullNameLabel.heightAnchor.constraint(equalToConstant: 50),
      
      uploadItemButton.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 15),
      uploadItemButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      uploadItemButton.widthAnchor.constraint(equalToConstant: 290),
      uploadItemButton.heightAnchor.constraint(equalToConstant: 40)
    ])
  }
  
  // MARK: - Setup UI
  private func setupUI() {
    selectionStyle = .none
    backgroundColor = UIColor(hex: "#FAF9FFFF")
    
    avatarImageView.image = UserDefaultsService.userAvatar ?? UIImage(named: "empty_avatar")
    uploadItemButton.createProfileInfoButton(image: UIImage(named: "share") ?? .actions, title: "Upload Item")
    
    guard let firstName = UserDefaultsService.userModel?.firstName,
          let lastName = UserDefaultsService.userModel?.lastName else { return }
    
    let fullName = "\(firstName) \(lastName)"
    fullNameLabel.text = fullName
    
    changePhotoButton.addTarget(self, action: #selector(actionChangePhoto), for: .touchUpInside)
  }
}
