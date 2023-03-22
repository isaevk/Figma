//
//  SingInViewController.swift
//  Figma
//
//  Created by Kirill Dev on 13.03.2023.
//

import UIKit

final class SingInViewController: UIViewController {

  
  @IBOutlet private weak var firstNameTxtField: UITextField!
  
  @IBOutlet private weak var lastNameTxtField: UITextField!
  
  @IBOutlet private weak var emailTxtField: UITextField!
  
  @IBOutlet private weak var passwordTxtField: UITextField!
  
  @IBOutlet private weak var signInButton: UIButton!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()

  }

  // MARK: - РАЗБИТЬ НА МЕТОДЫ
  @IBAction private func signinAction(_ sender: Any) {

      guard let email = emailTxtField.text, emailTxtField.text?.count != 0 else {
      showAlert("Enter correct email", message: "")
      return
    }
    if isValidEmail(emailID: email) {
      guard let _ = passwordTxtField.text, passwordTxtField.text?.count != 0 else {
        showAlert("Enter correct password", message: "")
        return
      }
    } else {
      showAlert("Email is not valid", message: "")
      return
    }
    
    guard let password = passwordTxtField.text else { return }
    
    do {
      try KeychainManager.save(service: "figma.com",
                               account: email,
                               password: password.data(using: .utf8) ?? Data())
      
    } catch {
      showAlert("This account is already registered", message: "You can log in by clicking Log In")
      print(error)
    }
    
    guard let firstNameTrimmingText = firstNameTxtField.text?.trimmingCharacters(in: .whitespaces),
          let lastNameTrimmingText = lastNameTxtField.text?.trimmingCharacters(in: .whitespaces) else { return }
    
    let userObject = UserModel(firstName: firstNameTrimmingText, lastName: lastNameTrimmingText)
    UserDefaultsService.userModel = userObject
    
    
    let storyboard = UIStoryboard(name: "MainTabBarController", bundle: nil)
    guard let vc = storyboard.instantiateViewController(identifier: "mainTabBar") as? MainTabBarController else {return }
    vc.modalPresentationStyle = .fullScreen
    show(vc, sender: nil)
  }
  
  
  @IBAction private func logInAction(_ sender: Any) {
    let storyboard = UIStoryboard(name: "LoginViewController", bundle: nil)
    let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
    vc.modalPresentationStyle = .fullScreen
    show(vc, sender: nil)
  }
  
  
}

