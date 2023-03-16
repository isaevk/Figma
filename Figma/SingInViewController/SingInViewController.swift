//
//  SingInViewController.swift
//  Figma
//
//  Created by Kirill Dev on 13.03.2023.
//

import UIKit

final class SingInViewController: UIViewController {

  
  @IBOutlet weak var firstNameTxtField: UITextField!
  
  @IBOutlet weak var lastNameTxtField: UITextField!
  
  @IBOutlet weak var emailTxtField: UITextField!
  
  @IBOutlet weak var passwordTxtField: UITextField!
  
  @IBOutlet weak var signInButton: UIButton!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  
  @IBAction func signinAction(_ sender: Any) {
    guard let email = emailTxtField.text,
          let password = passwordTxtField.text
    else { return }
    
    do {
      try KeychainManager.save(service: "Figma",
                               account: email,
                               password: password.data(using: .utf8) ?? Data()) 
      
      
    } catch {
      showAlert("This account is already registered", message: "You can log in by clicking Log In")
      print(error)
    }
    
  }
  
  
  
  
  
  
  
  @IBAction func logInAction(_ sender: Any) {
    let storyboard = UIStoryboard(name: "LoginViewController", bundle: nil)
    let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
    vc.modalPresentationStyle = .fullScreen
    present(vc, animated: true)
  }
  
  
}

