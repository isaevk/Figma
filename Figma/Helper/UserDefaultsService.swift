//
//  UserDefaultsService.swift
//  Figma
//
//  Created by Kirill Dev on 17.03.2023.
//

import UIKit

//MARK: - UserDefaultsService

final class UserDefaultsService {
  
  private enum SettingsKeys: String {
    case userModel
    case avatar
  }
  
  static var userModel: UserModel! {
    get {
      guard let savedData = UserDefaults.standard.object(forKey: SettingsKeys.userModel.rawValue) as? Data,
            let decodedModel = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedData) as? UserModel else { return nil }
      return decodedModel
    }
    
    set {
      let defaults = UserDefaults.standard
      let keyModel = SettingsKeys.userModel.rawValue
      
      if let userModel = newValue {
        if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: userModel, requiringSecureCoding: false) {
          defaults.set(savedData, forKey: keyModel)
        }
      }
    }
  }
  
  static var userAvatar: UIImage! {
    get {
      guard let savedData = UserDefaults.standard.object(forKey: SettingsKeys.avatar.rawValue) as? Data,
            let decodedImage = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedData) as? UIImage else { return nil }
      return decodedImage
    }
    
    set {
      let defaults = UserDefaults.standard
      let keyAvatar = SettingsKeys.avatar.rawValue
      
      if let userAvatar = newValue {
        if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: userAvatar, requiringSecureCoding: false) {
          defaults.set(savedData, forKey: keyAvatar)
        }
      }
    }
  }
}
