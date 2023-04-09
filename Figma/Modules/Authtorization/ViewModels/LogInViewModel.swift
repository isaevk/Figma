//
//  LoginViewModel.swift
//  Figma
//
//  Created by Kirill Dev on 28.03.2023.
//

import Foundation

final class LogInViewModel {
  weak var coordinator: AuthorizationCoordinator!
  
  func goToSignIn(){
    coordinator.goToSignInPage()
  }
  
  func goToTabBar() {
    coordinator.goToTabBarPage()
  }
  
  func logInButtonTapped(email: String?, password: String?) {
    
    // Text validation
    guard let correctEmail = email, correctEmail.count != 0, isValidEmail(emailID: correctEmail) else {
      AlertService.showAlert("Enter correct email", message: "Try again", style: .alert)
      return
    }
    
    // Keychain manager
    guard let data = KeychainManager.get(service: "figma.com", account: correctEmail) else {
      AlertService.showAlert("There is no user with this password", message: "Try again", style: .alert)
      return
    }
    
    let correctPassword = String(decoding: data, as: UTF8.self)
    
    if password != correctPassword {
      AlertService.showAlert("Wrong password entered", message: "Try again", style: .alert)
    } else {
      goToTabBar()
    }
  }
}
