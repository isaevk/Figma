//
//  Storyboarded.swift
//  Figma
//
//  Created by Kirill Dev on 30.03.2023.
//

import UIKit

//MARK: - Storyboarded

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let className = String(describing: self)
        let storyboard = UIStoryboard(name: "MainTabBarController", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
