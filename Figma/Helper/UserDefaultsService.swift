//
//  UserDefaultsService.swift
//  Figma
//
//  Created by Kirill Dev on 17.03.2023.
//

import UIKit

//MARK: - User Defaults Service

final class UserDefaultsService {
  
  private enum SettingsKeys: String {
    case fullName
    case avatar
  }
  
  static var userModel: UserModel? {
    get {
      guard let savedData = UserDefaults.standard.object(forKey: SettingsKeys.fullName.rawValue) as? Data,
            let decodedModel = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedData) as? UserModel else  { return  nil }
      return decodedModel
    }

    set {
      let defaults = UserDefaults.standard
      let keyModel = SettingsKeys.fullName.rawValue
      
      if let userModel = newValue {
        if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: userModel, requiringSecureCoding: false) {
          defaults.set(savedData, forKey: keyModel)
        }
      }
    }
  }
  
  static var userAvatar: UIImage? {
    get {
      guard let savedData = UserDefaults.standard.object(forKey: SettingsKeys.avatar.rawValue) as? Data,
            let decodedImage = try? NSKeyedUnarchiver.unarchivedObject(ofClass: UIImage.self, from: savedData) else { return nil }
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
