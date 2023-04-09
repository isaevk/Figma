//
//  SignInViewModel.swift
//  Figma
//
//  Created by Kirill Dev on 28.03.2023.
//

import Foundation

final class SignInViewModel {
  weak var coordinator: AuthorizationCoordinator!
  
  func goToLogIn() {
    coordinator.goToLogInPage()
  }
  
  func goToTabBar() {
    coordinator.goToTabBarPage()
  }

  func signInButtonTapped(firstName: String?, lastName: String?, email: String?, password: String?) {
    // Text validation
    guard let _ = firstName, firstName?.count != 0 else {
      AlertService.showAlert("Enter your first name", message: nil, style: .alert)
      return
    }
    guard let _ = lastName, lastName?.count != 0 else {
      AlertService.showAlert("Enter your last name", message: nil, style: .alert)
      return
    }
    
    guard let correctEmail = email, correctEmail.count != 0 else {
      AlertService.showAlert("Enter correct email", message: nil, style: .alert)
      return
    }
    
    if isValidEmail(emailID: correctEmail) {
      guard let _ = password, password?.count != 0 else {
        AlertService.showAlert("Enter correct password", message: nil, style: .alert)
        return
      }
    } else {
      AlertService.showAlert("Email is not valid", message: nil, style: .alert)
      return
    }
    
    // Save UserDefaults
    guard let firstNameTrimmingText = firstName?.trimmingCharacters(in: .whitespaces),
          let lastNameTrimmingText = lastName?.trimmingCharacters(in: .whitespaces),
          let emailTrimmingText = email?.trimmingCharacters(in: .whitespaces) else { return }
    
    let userObject = UserModel(firstName: firstNameTrimmingText,
                               lastName: lastNameTrimmingText,
                               email: emailTrimmingText,
                               avatar: nil)
    UserDefaultsService.userModel = userObject
    
    // Save Keychain
    guard let correctPassword = password else { return }
    
    do {
      try KeychainManager.save(service: "figma.com",
                               account: correctEmail,
                               password: correctPassword.data(using: .utf8) ?? Data())
    } catch {
      AlertService.showAlert("This account is already registered", message: "You can log in by clicking Log In", style: .alert)
      print(error)
    }
  }
}
