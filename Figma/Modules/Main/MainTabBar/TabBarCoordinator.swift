//
//  TabBarCoordinator.swift
//  Figma
//
//  Created by Kirill Dev on 31.03.2023.
//

import UIKit

final class TabBarCoordinator: Coordinator {
  var parentCoordinator: AuthorizationCoordinator?
  var childCoordinators =  [Coordinator]()
  var navigationController: UINavigationController
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    let mainTabBarController = MainTabBarController.instantiate()
    mainTabBarController.coordinator = self
    navigationController.navigationBar.isHidden = true
    navigationController.pushViewController(mainTabBarController, animated: true)
  }
}
