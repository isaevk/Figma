//
//  MainTabBarController.swift
//  Figma
//
//  Created by Kirill Dev on 15.03.2023.
//

import UIKit

final class MainTabBarController: UITabBarController {
  
  // MARK: - Private Properties
//  private let chooseShoes = UISegmentedControl()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    generateTapBar()
    setTapBarAppearance()
  }
  
  // MARK: - Private Methods
  private func generateTapBar() {
    viewControllers = [
            generateVC(viewVontoller: HomeViewController(), title: "Home", image: UIImage(systemName: "house")),
            generateVC(viewVontoller: LikeListViewController(), title: "Wishlist", image: UIImage(systemName: "heart")),
      //      generateVC(viewVontoller: UserViewController(), title: "Me", image: UIImage(systemName: "person.fill"))
    ]
  }
  
  private func generateVC(viewVontoller: UIViewController, title: String, image: UIImage?) -> UIViewController {
    viewVontoller.tabBarItem.title = title
    viewVontoller.tabBarItem.image = image
    return viewVontoller
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
    tabBar.itemPositioning = .centered
    
    roundLayer.fillColor = UIColor(hex: "#ffFFFFFE")?.cgColor
    tabBar.tintColor = UIColor(hex: "#ff531B93")
    tabBar.unselectedItemTintColor = UIColor(hex: "#ff40357D")
  }
}
