//
//  HomeViewModel.swift
//  Figma
//
//  Created by Kirill Dev on 29.03.2023.
//

import UIKit

final class HomeViewModel {
  weak var coordinator: Coordinator!
  
// MARK: - Setup Navigation Bar
  func setupNavBar(navCon: UINavigationController?) {
    let burgerBarButtonItem = UIBarButtonItem(image: UIImage(named: "four.line"), style: .done, target: nil, action: nil)
    navCon?.navigationBar.topItem?.leftBarButtonItem = burgerBarButtonItem
    navCon?.navigationBar.tintColor = .black
    
    let logo = UIImage(named: "logo")
    let imageView = UIImageView(image: logo)
    navCon?.navigationBar.topItem?.titleView = imageView

    let avatar =  UserDefaultsService.userAvatar ?? UIImage(named: "empty_avatar")
        
    let raundedAvatar = avatar?.scalePreservingAspectRatio(targetSize: CGSize(width: 40, height: 40)).withRoundedCorners(radius: 10)?.withRenderingMode(.alwaysOriginal)
    let rightButton = UIBarButtonItem(image: raundedAvatar, style: .plain, target: self, action: nil)
    
    navCon?.navigationBar.topItem?.rightBarButtonItem = rightButton
  }

  // MARK: - Setup Collection View
  func setupCollectionView(collectionView: UICollectionView, compositionalLayout: UICollectionViewCompositionalLayout) {
    collectionView.collectionViewLayout = compositionalLayout
    collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    collectionView.backgroundColor = .none
    collectionView.register(LatestCollectionViewCell.self, forCellWithReuseIdentifier: LatestCollectionViewCell.reuseIdentifier)
    collectionView.register(SaleCollectionViewCell.self, forCellWithReuseIdentifier: SaleCollectionViewCell.reuseIdentifier)
    collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.reuseIdentifier)
  }
}
