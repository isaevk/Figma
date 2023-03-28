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
  
  
  var profile: Profile?  {
    didSet {
      guard let profile = profile else { return }
      self.firstNameTxtField.text = profile.firstName
      self.lastNameTxtField.text = profile.lastName
      self.emailTxtField.text = profile.email
      self.passwordTxtField.text = profile.password
    }
  }
  
  
  
  
  @IBOutlet private weak var signInButton: UIButton!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    profile = Profile(firstName: firstNameTxtField.text!,
                      lastName: lastNameTxtField.text!,
                      email: emailTxtField.text!,
                      password: passwordTxtField.text!)
      }

// MARK: - Singin Button Action
  @IBAction private func signinAction(_ sender: Any) {

    chackingTextInTxtField()
    saveKeychain()
    saveUserDefaults()

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
  
  
  
  // MARK: - Text validation
  private func chackingTextInTxtField() {
    guard let email = emailTxtField.text, emailTxtField.text?.count != 0 else {
      showAlert("Enter correct email", message: "", style: .alert)
    return
  }
  if isValidEmail(emailID: email) {
    guard let _ = passwordTxtField.text, passwordTxtField.text?.count != 0 else {
      showAlert("Enter correct password", message: "", style: .alert)
      return
    }
  } else {
    showAlert("Email is not valid", message: "", style: .alert)
    return
  }
  }
  
  // MARK: - Save UserDefaults
  private func saveUserDefaults() {
    guard let firstNameTrimmingText = firstNameTxtField.text?.trimmingCharacters(in: .whitespaces),
          let lastNameTrimmingText = lastNameTxtField.text?.trimmingCharacters(in: .whitespaces) else { return }
    
    let userObject = UserModel(firstName: firstNameTrimmingText, lastName: lastNameTrimmingText, avatar: nil)
    UserDefaultsService.userModel = userObject
  }
  
  
  
  
  
  
  // MARK: - Save Keychain
  private func saveKeychain() {
    guard let password = passwordTxtField.text,
            let email = emailTxtField.text else { return }
    
    do {
      try KeychainManager.save(service: "figma.com",
                               account: email,
                               password: password.data(using: .utf8) ?? Data())
      
    } catch {
      showAlert("This account is already registered", message: "You can log in by clicking Log In", style: .alert)
      print(error)
    }
  }
}

