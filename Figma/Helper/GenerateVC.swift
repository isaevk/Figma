//
//  GenerateVC.swift
//  Figma
//
//  Created by Kirill Dev on 23.03.2023.
//

import UIKit

func generateVC(viewVontoller: UIViewController, image: UIImage?) -> UIViewController {
  viewVontoller.tabBarItem.image = image
  return viewVontoller
}
