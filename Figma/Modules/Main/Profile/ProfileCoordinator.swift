//
//  ProfileCoordinator.swift
//  Figma
//
//  Created by Kirill Dev on 31.03.2023.
//

import UIKit

final class ProfileCoordinator: Coordinator {
  var parentCoordinator: Coordinator?
  var childCoordinators = [Coordinator]()
  var navigationController: UINavigationController
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    let profileViewController = ProfileViewController.instantiate()
    let profileViewModel = ProfileViewModel()
    profileViewController.coordinator = self
    profileViewController.viewModel = profileViewModel
    profileViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "person"), tag: 4)
    navigationController.pushViewController(profileViewController, animated: true)
  }
}
