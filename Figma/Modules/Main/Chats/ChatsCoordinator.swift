//
//  ChatsCoordinator.swift
//  Figma
//
//  Created by Kirill Dev on 31.03.2023.
//

import UIKit

final class ChatsCoordinator: Coordinator {
  var parentCoordinator: Coordinator?
  var childCoordinators = [Coordinator]()
  var navigationController: UINavigationController
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    var chatsViewController = ChatsViewController.instantiate()
    chatsViewController.coordinator = self
    chatsViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "dialog"), tag: 3)
    navigationController.pushViewController(chatsViewController, animated: true)
  }
}
