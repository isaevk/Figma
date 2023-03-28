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

    
    let logo = UIImage(named: "logo")
    let imageView = UIImageView(image: logo)
    navigationBar.topItem?.titleView = imageView
    }



}
