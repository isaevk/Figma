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
  
  init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }
  
  func encode(with coder: NSCoder) {
    coder.encode(firstName, forKey: "firstName")
    coder.encode(lastName, forKey: "lastName")
  }
  
  required init?(coder: NSCoder) {
    firstName = coder.decodeObject(forKey: "firstName") as? String ?? ""
    lastName = coder.decodeObject(forKey: "lastName") as? String ?? ""
  }
}
