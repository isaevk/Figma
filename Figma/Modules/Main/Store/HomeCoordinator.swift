//
//  HomeCoordinator.swift
//  Figma
//
//  Created by Kirill Dev on 31.03.2023.
//

import UIKit

final class HomeCoordinator: Coordinator {
  var parentCoordinator: Coordinator?
  var childCoordinators = [Coordinator]()
  
  var navigationController: UINavigationController
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    let homeViewController = HomeViewController.instantiate()
    let homeViewModel = HomeViewModel()
    homeViewController.coordinator = self
    homeViewController.viewModel = homeViewModel
    homeViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "house"), tag: 0)
    navigationController.pushViewController(homeViewController, animated: false)
  }
}
