//
//  AppCoordinator.swift
//  Figma
//
//  Created by Kirill Dev on 28.03.2023.
//

import UIKit

protocol Coordinator {
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}


class AppCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navCon : UINavigationController) {
        self.navigationController = navCon
    }
    
    func start() {
        print("App Coordinator start")
    }
}
