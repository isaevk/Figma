//
//  MainTabBarController.swift
//  Figma
//
//  Created by Kirill Dev on 15.03.2023.
//

import UIKit

final class MainTabBarController: UITabBarController {
  // MARK: - Public Properties
  var coordinator: TabBarCoordinator!
  
  // MARK: - Private Properties
  private let homeCoordinator = HomeCoordinator(navigationController: UINavigationController())
  private let likeCoordinator = LikeCoordinator(navigationController: UINavigationController())
  private let bagCoordinator = BagCoordinator(navigationController: UINavigationController())
  private let chatsCoordinator = ChatsCoordinator(navigationController: UINavigationController())
  private let profileCoordinator = ProfileCoordinator(navigationController: UINavigationController())

  // MARK: - Override Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    generateTapBar()
    setTapBarAppearance()
  }
  
  // MARK: - Generate Tab Bar
  private func generateTapBar() {
    homeCoordinator.start()
    likeCoordinator.start()
    bagCoordinator.start()
    chatsCoordinator.start()
    profileCoordinator.start()
    
    viewControllers = [homeCoordinator.navigationController,
                       likeCoordinator.navigationController,
                       bagCoordinator.navigationController,
                       chatsCoordinator.navigationController,
                       profileCoordinator.navigationController
    ]
  }

  // MARK: - Setup Appearance TabBar
  private func setTapBarAppearance() {
    let roundLayer = CAShapeLayer()

    let positionOnX: CGFloat = 10
    let positionOnY: CGFloat = 14
    let wigth = tabBar.bounds.width - positionOnX * 2
  
    let hieght = tabBar.bounds.height + positionOnY * 2

    let bezierPath = UIBezierPath(roundedRect: CGRect(x: positionOnX,
                                                      y: tabBar.bounds.minY - positionOnY,
                                                      width: wigth,
                                                      height: hieght),
                                  cornerRadius: hieght / 2)

    roundLayer.path = bezierPath.cgPath
    roundLayer.fillColor = UIColor(hex: "#ffFFFFFF")?.cgColor
    
    tabBar.layer.insertSublayer(roundLayer, at: 0)
    tabBar.itemWidth = wigth / 5
    tabBar.itemPositioning = .fill
    tabBar.unselectedItemTintColor = UIColor(hex: "#909090C8")
    tabBar.tintColor = UIColor(hex: "#737297FF")
    tabBar.selectionIndicatorImage = UIImage(named: "ellipse")
  }
}

// MARK: - Extension Storyboarded
extension MainTabBarController: Storyboarded { }
