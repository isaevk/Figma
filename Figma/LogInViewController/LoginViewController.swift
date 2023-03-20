//
//  LoginViewController.swift
//  Figma
//
//  Created by Kirill Dev on 15.03.2023.
//

import UIKit

final class LoginViewController: UIViewController {

  @IBOutlet private weak var emailTxtField: UITextField!
  
  @IBOutlet private weak var passwordTxtField: UITextField!
  
  @IBOutlet private weak var hidePasswordButton: UIButton!
  
  @IBOutlet private weak var loginButton: UIButton!
  
  
  override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    

  @IBAction private func hidePasswordAction(_ sender: Any) {
    hidePasswordButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
    hidePasswordButton.setImage(UIImage(systemName: "eye"), for: .selected)
    hidePasswordButton.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
  }
  
  @objc private func togglePasswordView(_ sender: Any) {
    passwordTxtField.isSecureTextEntry.toggle()
    hidePasswordButton.isSelected.toggle()
  }
  
  
  @IBAction private func loginAction(_ sender: Any) {
//    guard let email = emailTxtField.text else { return }
//    
//    guard let data = KeychainManager.get(service: "Figma", account: email) else {
//      print("Failed to read password")
//      return
//    }
//    let password = String(decoding: data, as: UTF8.self)
//    print(password)
//    passwordTxtField.text = password
    
    let storyboard = UIStoryboard(name: "MainTabBarController", bundle: nil)
    let vc = storyboard.instantiateViewController(withIdentifier: "mainTabBar")
    vc.modalPresentationStyle = .fullScreen
    present(vc, animated: true)
  }
  
  
}
