//
//  SelfConfiguringCell.swift
//  Figma
//
//  Created by Kirill Dev on 05.04.2023.
//

import Foundation

protocol SelfConfiguringCell {
  static var reuseIdentifier: String { get }
  func configure(with item: Item)
}
