//
//  UIButton+.swift
//  Figma
//
//  Created by Kirill Dev on 24.03.2023.
//

import UIKit

func bottomButtonsConfiguration() -> UIButton.Configuration {
  var configuration: UIButton.Configuration = .filled()
  configuration.image = UIImage(systemName: "square.and.arrow.up")
  configuration.background.backgroundColor = UIColor(hex: "#4E55D7")
  
  configuration.baseForegroundColor = .white
  configuration.cornerStyle = .large
  configuration.imagePadding = 10
  configuration.titlePadding = 50
  configuration.imagePlacement = .leading
  configuration.imageColorTransformer = UIConfigurationColorTransformer { _ in
    return UIColor(hex: "#4E55D7") ?? .systemGray
  }
  configuration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { attribute in
    var muttableAttribute = attribute
    muttableAttribute.font = .boldSystemFont(ofSize: 15)
    return muttableAttribute
  }
  
  return configuration
}

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
