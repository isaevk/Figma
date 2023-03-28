//
//  Builder.swift
//  Figma
//
//  Created by Kirill Dev on 23.03.2023.
//

import UIKit

final class Builder {
  static func createHomeVC() -> UIViewController {
    let homeVC = generateVC(viewVontoller: HomeViewController(),
                            image: UIImage(named: "house"))
    return homeVC
  }
  
  static func createLikeListVC() -> UIViewController {
    let likeListVC = generateVC(viewVontoller: LikeListViewController(),
                                image: UIImage(named: "heart"))
    return likeListVC
  }
  
  static func createBagC() -> UIViewController {
    let bagVC = generateVC(viewVontoller: BagViewController(),
                           image: UIImage(named: "basket"))
    return bagVC
  }
  
  static func createChatsVC() -> UIViewController {
    let chatsVC = generateVC(viewVontoller: ChatsViewController(),
                             image: UIImage(named: "dialog"))
    return chatsVC
  }
  
  static func createProfileVC() -> UIViewController {
    let profileVC = generateVC(viewVontoller: ProfViewController(),
                               image: UIImage(named: "person"))
    return profileVC
  }
}
