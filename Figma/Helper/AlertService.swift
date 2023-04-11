//
// AlertService.swift
//  Figma
//
//  Created by Kirill Dev on 16.03.2023.
//

import UIKit

//MARK: - Alert Service

final class AlertService {
  static func showAlert(_ title: String?,
                        message: String?,
                        style: UIAlertController.Style,
                        actions: [UIAlertAction] = [UIAlertAction(title: "Ok", style: .cancel)],
                        handler: ((UIAlertAction) -> Void)? = nil,
                        textFields: [((UITextField) -> Void)] = []) {
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: style)
    
    if actions.isEmpty {
      alert.addAction(UIAlertAction(title: "Ok", style: .default))
    } else {
      for action in actions {
        alert.addAction(action)
      }
    }
    
    for textField in textFields {
      alert.addTextField(configurationHandler: textField)
    }
    
    if let topVC = UIApplication.getTopViewController() {
      topVC.present(alert, animated: true)
    }
  }
}
