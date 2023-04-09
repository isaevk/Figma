//
//  ApplicationCoordinator.swift
//  Figma
//
//  Created by Kirill Dev on 31.03.2023.
//

import UIKit

final class AuthorizationCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
  var childCoordinators = [Coordinator]()
  var navigationController: UINavigationController
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  // MARK: - Start
  func start() {
    navigationController.delegate = self
    goToSignInPage()
  }
  
  // MARK: - Go Sign In VC
  func goToSignInPage() {
    let storyboard = UIStoryboard.init(name: "SignInViewController", bundle: .none)
    guard let signInViewController = storyboard.instantiateViewController(withIdentifier: "SignInViewController") as? SignInViewController else { return }
    let signInViewModel = SignInViewModel()
    signInViewModel.coordinator = self
    signInViewController.viewModel = signInViewModel
    navigationController.pushViewController(signInViewController, animated: true)
  }
  
  // MARK: - Go Login VC
  func goToLogInPage() {
    let storyboard = UIStoryboard.init(name: "LogInViewController", bundle: .none)
    guard let logInViewController = storyboard.instantiateViewController(withIdentifier: "LogInViewController") as? LogInViewController else { return }
    let logInViewModel = LogInViewModel()
    logInViewModel.coordinator = self
    logInViewController.viewModel = logInViewModel
    navigationController.navigationBar.isHidden = true
    navigationController.pushViewController(logInViewController, animated: true)
  }
  
  // MARK: - Go Tab Bar
  func goToTabBarPage() {
    let child = TabBarCoordinator(navigationController: navigationController)
    childCoordinators.append(child)
    child.parentCoordinator = self
    child.start()
  }
  
  // MARK: Remove Child Coordinator
  func childDidFinish(_ child: Coordinator?) {
    for (index, coordinator) in childCoordinators.enumerated() {
      if coordinator === child {
        childCoordinators.remove(at: index)
        break
      }
    }
  }

  func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
    guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
      return
    }
    
    if navigationController.viewControllers.contains(fromViewController) {
      return
    }
    
    if let tabBarViewController = fromViewController as? MainTabBarController {
      childDidFinish(tabBarViewController.coordinator)
    }
  }
}
