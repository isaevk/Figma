//
//  SignInViewController.swift
//  Figma
//
//  Created by Kirill Dev on 13.03.2023.
//

import UIKit

final class SignInViewController: UIViewController {
  
  // MARK: - Public Properties
  var viewModel: SignInViewModel!

  // MARK: - Private Properties
  @IBOutlet private weak var firstNameTxtField: UITextField!
  @IBOutlet private weak var lastNameTxtField: UITextField!
  @IBOutlet private weak var emailTxtField: UITextField!
  @IBOutlet private weak var passwordTxtField: UITextField!
  @IBOutlet private weak var signInButton: UIButton!
  
  // MARK: - IBAction
  @IBAction private func signinAction(_ sender: Any) {
    viewModel.signInButtonTapped(firstName: firstNameTxtField.text,
                                 lastName: lastNameTxtField.text,
                                 email: emailTxtField.text,
                                 password: passwordTxtField.text)
    viewModel.goToTabBar()
  }
  
  @IBAction private func logInAction(_ sender: Any) {
    viewModel.goToLogIn()
  }
}

