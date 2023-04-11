//
//  Coordinator.swift
//  Figma
//
//  Created by Kirill Dev on 31.03.2023.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
