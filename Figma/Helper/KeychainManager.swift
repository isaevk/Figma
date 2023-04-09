//
//  KeychainManager.swift
//  Figma
//
//  Created by Kirill Dev on 16.03.2023.
//

import UIKit

//MARK: - Keychain Manager

final class KeychainManager {
  
  enum KeychainError: Error {
    case duplicateEntry
    case unknown(OSStatus)
  }
  
  static func save(
    service: String,
    account: String,
    password: Data
  ) throws {
    let query: [String: AnyObject] = [
      kSecClass as String: kSecClassGenericPassword,
      kSecAttrService as String: service as AnyObject,
      kSecAttrAccount as String: account as AnyObject,
      kSecValueData as String: password as AnyObject,
    ]
    
    let status = SecItemAdd(query as CFDictionary, nil)
    
    guard status != errSecDuplicateItem else {
      throw KeychainError.duplicateEntry
    }
    
    guard status == errSecSuccess else {
      throw KeychainError.unknown(status)
    }
    
    print("saved")
  }
  
  static func get(
    service: String,
    account: String
  ) -> Data? {
    let query: [String: AnyObject] = [
      kSecClass as String: kSecClassGenericPassword,
      kSecAttrService as String: service as AnyObject,
      kSecAttrAccount as String: account as AnyObject,
      kSecReturnData as String: kCFBooleanTrue as AnyObject,
      kSecMatchLimit as String: kSecMatchLimitOne
    ]
    
    
    var result: AnyObject?
    let status = SecItemCopyMatching(query as CFDictionary, &result)
    
    
    print("Read status: \(status)")
    return result as? Data
  }
}
