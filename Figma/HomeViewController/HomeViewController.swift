//
//  HomeViewController.swift
//  Figma
//
//  Created by Kirill Dev on 20.03.2023.
//

import UIKit

class HomeViewController: UIViewController {

  @IBOutlet weak var navigationBar: UINavigationBar!
  

  
  
  @IBOutlet weak var burgerMenuNavBar: UIBarButtonItem!
  
  
  
  override func viewDidLoad() {
        super.viewDidLoad()

//    navigationBar.largeContentImage = UIImage(named: "navBar_logo")
    navigationBar.setBackgroundImage(UIImage(named: "navBar_logo"), for: .compact)
    burgerMenuNavBar.image = UIImage(named: "burger_menu")
    }



}
