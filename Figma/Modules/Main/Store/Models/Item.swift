//
//  Item.swift
//  Figma
//
//  Created by Kirill Dev on 04.04.2023.
//

import Foundation

struct Item: Decodable, Hashable {
  let category: String
  let name: String
  let price: Double
  let image_url: String
  let discount: Int?
}
