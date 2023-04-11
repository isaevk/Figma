//
//  MenuCellSource.swift
//  Figma
//
//  Created by Kirill Dev on 27.03.2023.
//

import UIKit

// MARK: - Menu Cell Source

struct MenuCell {
  let symbol: UIImage
  let name: String
  let pointer: Bool
}

struct NameCell {
  static let store = "Trade store"
  static let payMethod = "Payment method"
  static let balance = "Balance"
  static let history = "Trade history"
  static let restorePurchase = "Restore Purchase"
  static let help = "Help"
  static let logOut = "Log out"
  static let balanceSum = "1678$" 
}

struct Symbol {
  static let wallet = UIImage(named: "wallet")
  static let refresh = UIImage(named: "refresh")
  static let help = UIImage(named: "help")
  static let exit = UIImage(named: "exit")
  static let arrow = UIImage(named: "arrow")
}

struct Sourse {
  static func makeCell() -> [MenuCell] {
    return [
      MenuCell(symbol: Symbol.wallet ?? .add, name: NameCell.store, pointer: true),
      MenuCell(symbol: Symbol.wallet ?? .add, name: NameCell.payMethod, pointer: true),
      MenuCell(symbol: Symbol.wallet ?? .add, name: NameCell.balance, pointer: false),
      MenuCell(symbol: Symbol.wallet ?? .add, name: NameCell.history, pointer: true),
      MenuCell(symbol: Symbol.refresh ?? .add, name: NameCell.restorePurchase, pointer: true),
      MenuCell(symbol: Symbol.help ?? .add, name: NameCell.help, pointer: false),
      MenuCell(symbol: Symbol.exit ?? .add, name: NameCell.logOut, pointer: false),
    ]
  }
}
