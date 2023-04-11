//
//  LoginViewController.swift
//  Figma
//
//  Created by Kirill Dev on 15.03.2023.
//

import UIKit

final class LogInViewController: UIViewController {
  
  // MARK: - Public Properties
  var viewModel: LogInViewModel!
  
  // MARK: - Private Properties
  @IBOutlet private var emailTxtField: UITextField!
  @IBOutlet private var passwordTxtField: UITextField!
  @IBOutlet private var hidePasswordButton: UIButton!
  @IBOutlet private var loginButton: UIButton!
  
  // MARK: - Override Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    passwordTxtField.isSecureTextEntry = true
    hidePasswordButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
    hidePasswordButton.setImage(UIImage(systemName: "eye"), for: .selected)
  }

  // MARK: - IBAction
  @IBAction private func hidePasswordAction(_ sender: Any) {
    passwordTxtField.isSecureTextEntry.toggle()
    hidePasswordButton.isSelected.toggle()
  }
  
  @IBAction private func loginAction(_ sender: Any) {
    viewModel.logInButtonTapped(email: emailTxtField.text, password: passwordTxtField.text)
  }
}
