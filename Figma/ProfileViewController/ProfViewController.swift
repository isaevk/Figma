//
//  ProfViewController.swift
//  Figma
//
//  Created by Kirill Dev on 23.03.2023.
//

import UIKit
import Kingfisher

final class ProfViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
  }
  
  private func setupTableView() {
    tableView.delegate = self
    tableView.dataSource = self
    tableView.separatorColor = UIColor(hex: "#FAF9FF")
    tableView.register(ProfileInfoTableViewCell.self, forCellReuseIdentifier: "ProfileInfoCell")
    tableView.register(ProfileMenuTableViewCell.self, forCellReuseIdentifier: "ProfileMenuCell")
  }
}



// MARK: - UITableViewDataSource

extension ProfViewController: UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    2
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section {
    case 0: return 1
    case 1: return 7
    default: return 0
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.section {
    case 0:
      guard let infoCell = tableView.dequeueReusableCell(withIdentifier: "ProfileInfoCell", for: indexPath) as? ProfileInfoTableViewCell else { fatalError() }
      infoCell.showPickerViewController = { [weak self]   in
        self?.showImagePickerControllerActionSheet()
      }
      return infoCell
      
    case 1:
      guard let menuCell = tableView.dequeueReusableCell(withIdentifier: "ProfileMenuCell", for: indexPath) as? ProfileMenuTableViewCell else { fatalError() }
      return menuCell
    default: return UITableViewCell()
    }
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    switch indexPath.section {
    case 0: return 200
    case 1: return 60
    default: return UITableView.automaticDimension
    }
  }
}


// MARK: - Extension UIImagePickerControllerDelegate

extension ProfViewController: UIImagePickerControllerDelegate {
  
  func showImagePickerControllerActionSheet() {
    let photoLibraryAction = UIAlertAction(title: "Choose from library", style: .default) { (action) in
      self.showImagePickerViewController(sourseType: .photoLibrary)
    }
    
    let cameraAction = UIAlertAction(title: "Take from camera", style: .default) { (action) in
      self.showImagePickerViewController(sourseType: .camera)
    }
    
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
    
    showAlert("Choose your image",
              message: nil,
              style: .actionSheet,
              actions: [photoLibraryAction, cameraAction, cancelAction])
  }
  
  
  private func showImagePickerViewController(sourseType: UIImagePickerController.SourceType) {
    let imagePickerController = UIImagePickerController()
    imagePickerController.delegate = self
    imagePickerController.allowsEditing = true
    imagePickerController.sourceType = sourseType 
    imagePickerController.modalPresentationStyle = .overFullScreen
    present(imagePickerController, animated: true)
  }
  
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    let indexPath = IndexPath(row: 0, section: 0)
    guard let cell = tableView.cellForRow(at: indexPath) as? ProfileInfoTableViewCell else { fatalError() }
    
    if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
      UserDefaultsService.userAvatar = editedImage
        cell.avatarImageView.image = editedImage
    } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
        cell.avatarImageView.image = originalImage
    }
    
    dismiss(animated: true)
  }
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true)
  }
}


// MARK: - Extension UITableViewDelegate
extension ProfViewController: UITableViewDelegate { }

// MARK: - Extension UINavigationControllerDelegate
extension ProfViewController: UINavigationControllerDelegate { }
