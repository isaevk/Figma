//
//  UserModel.swift
//  Figma
//
//  Created by Kirill Dev on 16.03.2023.
//

import UIKit

final class UserModel: NSObject, NSCoding {
  
  let firstName: String
  let lastName: String
  let email: String
  let avatar: UIImage?
  
  init(firstName: String, lastName: String, email: String, avatar: UIImage?) {
    self.firstName = firstName
    self.lastName = lastName
    self.email = email
    self.avatar = avatar
  }
  
  func encode(with coder: NSCoder) {
    coder.encode(firstName, forKey: "firstName")
    coder.encode(lastName, forKey: "lastName")
    coder.encode(avatar, forKey: "avatar")
  }
  
  required init?(coder: NSCoder) {
    firstName = coder.decodeObject(forKey: "firstName") as? String ?? ""
    lastName = coder.decodeObject(forKey: "lastName") as? String ?? ""
    email = coder.decodeObject(forKey: "email") as? String ?? ""
    avatar = coder.decodeObject(forKey: "avatar") as? UIImage ?? UIImage(named: "empty_avatar")
  }
}
