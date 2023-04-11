//
//  Sections.swift
//  Figma
//
//  Created by Kirill Dev on 05.04.2023.
//

import UIKit

struct Section: Decodable, Hashable {
    let type: String
    let items: [Item]
}
