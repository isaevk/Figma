//
//  AppDelegate.swift
//  Figma
//
//  Created by Kirill Dev on 13.03.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  var appCoordinator: AuthorizationCoordinator?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let navController = UINavigationController()
    appCoordinator = AuthorizationCoordinator(navigationController: navController)
    appCoordinator?.start()
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = navController
    window?.makeKeyAndVisible()
    return true
  }
}
