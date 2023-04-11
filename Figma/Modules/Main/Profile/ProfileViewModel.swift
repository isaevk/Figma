//
//  ProfileViewModel.swift
//  Figma
//
//  Created by Kirill Dev on 29.03.2023.
//

import UIKit

final class ProfileViewModel {
  weak var coordinator: ProfileCoordinator!
  
  // MARK: - Setup Navigation Bar
  func setupNavigationBar(navCon: UINavigationController?) {
    let backBarButtonItem = UIBarButtonItem(image: UIImage(named: "arrow.back"), style: .done, target: nil, action: nil)
    navCon?.navigationBar.topItem?.title = "Profile"
    navCon?.navigationBar.topItem?.leftBarButtonItem = backBarButtonItem
  }
  
  // MARK: - Setup Table View
  func setupTableView(tableView: UITableView) {
    tableView.separatorColor = UIColor(hex: "#FAF9FF")
    tableView.register(ProfileInfoTableViewCell.self, forCellReuseIdentifier: "ProfileInfoCell")
    tableView.register(ProfileMenuTableViewCell.self, forCellReuseIdentifier: "ProfileMenuCell")
  }
}
