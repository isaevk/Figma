//
//  File.swift
//  Figma
//
//  Created by Kirill Dev on 17.03.2023.
//

import Foundation

//MARK: - UserDefaultsService

//final class UserDefaultsService {
//
//  static var instance = UserDefaultsService()
//
//  lazy var defaults = UserDefaults.standard
//
//  func set(value: Any?, key: String) {
//    defaults.set(value, forKey: key)
//  }
//
//  func get<T>(key: String) -> T? {
//    let value = defaults.object(forKey: key)
//    return value as? T
//  }
//
//  func remove(key: String) {
//    defaults.removeObject(forKey: key)
//  }
//}


final class UserDefaultsService {
  
  private enum SettingsKeys: String {
    case userModel
  }
  
  static var userModel: UserModel! {
    get {
      guard let savedData = UserDefaults.standard.object(forKey: SettingsKeys.userModel.rawValue) as? Data,
            let decodedModel = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedData) as? UserModel else { return nil}
      return decodedModel
    }
    
    set {
      let defaults = UserDefaults.standard
      let key = SettingsKeys.userModel.rawValue
      
      if let userModel = newValue {
        if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: userModel, requiringSecureCoding: false) {
          defaults.set(savedData, forKey: key)
        }
      }
    }
  }
}
