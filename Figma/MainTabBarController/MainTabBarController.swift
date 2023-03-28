//
//  MainTabBarController.swift
//  Figma
//
//  Created by Kirill Dev on 15.03.2023.
//

import UIKit

final class MainTabBarController: UITabBarController {
  
  // MARK: - Private Properties
  override func viewDidLoad() {
    super.viewDidLoad()
    generateTapBar()
    setTapBarAppearance()
  }
  
  // MARK: - Private Methods

  private func generateTapBar() {
    viewControllers = [
      Builder.createHomeVC(),
      Builder.createLikeListVC(),
      Builder.createBagC(),
      Builder.createChatsVC(),
      Builder.createProfileVC()
    ]
  }

  
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
    tabBar.layer.insertSublayer(roundLayer, at: 0)
    tabBar.itemWidth = wigth / 5
    tabBar.itemPositioning = .fill
    
    roundLayer.fillColor = UIColor(hex: "#ffFFFFFF")?.cgColor
    tabBar.unselectedItemTintColor = UIColor(hex: "#909090C8")
    tabBar.tintColor = UIColor(hex: "#737297FF")
    tabBar.selectionIndicatorImage = UIImage(named: "ellipse")

    
//    self.tabBar.layer.masksToBounds = true
//    self.tabBar.isTranslucent = true
//    self.tabBar.barStyle = .default
//    self.tabBar.layer.cornerRadius = 20
//    self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]


  }
}

