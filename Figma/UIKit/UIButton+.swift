//
//  UIButton+.swift
//  Figma
//
//  Created by Kirill Dev on 24.03.2023.
//

import UIKit

// MARK: - Extension UIButton - Profile Button

extension UIButton {
  func createProfileInfoButton(image: UIImage, title: String) {
    var configuration: UIButton.Configuration = .filled()
    
    configuration.image = image
    configuration.title = title
    configuration.cornerStyle = .capsule
    configuration.imagePadding = 40
    configuration.imagePlacement = .leading
    configuration.baseForegroundColor = .white
    configuration.baseBackgroundColor = UIColor(hex: "#4E55D7FF")
    configuration.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 20, bottom: 2, trailing: 80)
    
    configuration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { attribute in
      var muttableAttribute = attribute
      muttableAttribute.font = .boldSystemFont(ofSize: 15)
      return muttableAttribute
    }
    
    self.configuration = configuration
  }
}
