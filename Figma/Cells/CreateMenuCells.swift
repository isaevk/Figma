//
//  CreateMenuCells.swift
//  Figma
//
//  Created by Kirill Dev on 27.03.2023.
//

import UIKit

struct MenuCell {
  let symbol: UIImage
  let name: String
  let pointer: Bool
}

struct NamesCells {
  static let cell1 = "Trade store"
  static let cell2 = "Payment method"
  static let cell3 = "Balance"
  static let cell4 = "Trade history"
  static let cell5 = "Restore Purchase"
  static let cell6 = "Help"
  static let cell7 = "Log out"
}

struct Symbols {
  static let wallet = UIImage(named: "wallet")
  static let refresh = UIImage(named: "refresh")
  static let help = UIImage(named: "help")
  static let exit = UIImage(named: "exit")
}

struct Sourse {
  static func makeCell() -> [MenuCell] {
    return [
      MenuCell(symbol: Symbols.wallet ?? .add, name: NamesCells.cell1, pointer: true),
      MenuCell(symbol: Symbols.wallet ?? .add, name: NamesCells.cell2, pointer: true),
      MenuCell(symbol: Symbols.wallet ?? .add, name: NamesCells.cell3, pointer: false),
      MenuCell(symbol: Symbols.wallet ?? .add, name: NamesCells.cell4, pointer: true),
      MenuCell(symbol: Symbols.refresh ?? .add, name: NamesCells.cell5, pointer: true),
      MenuCell(symbol: Symbols.help ?? .add, name: NamesCells.cell6, pointer: false),
      MenuCell(symbol: Symbols.exit ?? .add, name: NamesCells.cell7, pointer: false),
    ]
  }
}
