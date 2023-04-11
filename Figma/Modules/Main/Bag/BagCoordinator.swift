//
//  BagCoordinator.swift
//  Figma
//
//  Created by Kirill Dev on 31.03.2023.
//

import UIKit

final class BagCoordinator: Coordinator {
  var parentCoordinator: Coordinator?
  var childCoordinators = [Coordinator]()
  var navigationController: UINavigationController
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    let homeViewController = BagViewController.instantiate()
    homeViewController.coordinator = self
    homeViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "basket"), tag: 2)
    navigationController.pushViewController(homeViewController, animated: true)
  }
}
