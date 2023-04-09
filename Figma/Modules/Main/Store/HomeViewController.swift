//
//  HomeViewController.swift
//  Figma
//
//  Created by Kirill Dev on 29.03.2023.
//

import UIKit

final class HomeViewController: UIViewController {
  
  // MARK: - Public Properties
  var viewModel: HomeViewModel!
  var coordinator: HomeCoordinator!
  
  // MARK: - Private Properties
  @IBOutlet private weak var searchBar: UISearchBar!
  @IBOutlet private weak var changeLocationButton: UIButton!
  @IBOutlet private weak var collectionView: UICollectionView!
  
  private var sections = Bundle.main.decode([Section].self, from: "shop.json")
  private var  dataSource: UICollectionViewDiffableDataSource<Section, Item>?
  
  // MARK: - Override Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  // MARK: - Setup UI
  private func setupUI() {
    viewModel.setupNavBar(navCon: navigationController)
    viewModel.setupCollectionView(collectionView: collectionView, compositionalLayout: createCompositionalLayout())
    
    createDataSource()
    reloadData()
  }
  
  // MARK: - Configuration Collection View
  private func configure<T: SelfConfiguringCell>(_ cellType: T.Type, with item: Item, for indexPath: IndexPath) -> T {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
      fatalError("Unable to dequeue \(cellType)")
    }
    cell.configure(with: item)
    return cell
  }
  
  // MARK: - Create Data Source
  private func createDataSource() {
    dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) { (collectionView, indexPath, item) in
      switch self.sections[indexPath.section].type {
      case "Flash sale":
        return self.configure(SaleCollectionViewCell.self, with: item, for: indexPath)
      default:
        return self.configure(LatestCollectionViewCell.self, with: item, for: indexPath)
      }
    }
    
    dataSource?.supplementaryViewProvider = { [weak self] collectionView, kind, indexPath in
      guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.reuseIdentifier, for: indexPath) as? SectionHeader else { return nil }
      
      guard let firstItem = self?.dataSource?.itemIdentifier(for: indexPath) else { return nil }
      guard let section = self?.dataSource?.snapshot().sectionIdentifier(containingItem: firstItem) else { return nil }
      if section.type.isEmpty { return nil }
      
      sectionHeader.titleLabel.text = section.type
      return sectionHeader
    }
  }
  
  // MARK: - Reload Data
  private func reloadData() {
    var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
    snapshot.appendSections(sections)
    
    for section in sections {
      snapshot.appendItems(section.items, toSection: section)
    }
    
    dataSource?.apply(snapshot)
  }
  
  // MARK: - Create Compositional Layout
  private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
    let layout = UICollectionViewCompositionalLayout { sectionIndex,  layoutEnviroment in
      let section = self.sections[sectionIndex]
      
      switch section.type {
      case "Flash sale":
        return self.createSaleSection(using: section)
      default:
        return self.createLatestSection(using: section)
      }
    }
    
    let configuration = UICollectionViewCompositionalLayoutConfiguration()
    configuration.interSectionSpacing = 10
    layout.configuration = configuration
    return layout
  }
  
  // MARK: - Create Latest Section
  private func createLatestSection(using section: Section) -> NSCollectionLayoutSection {
    let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(124), heightDimension: .estimated(159))
    let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
    layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 15)
    let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.35), heightDimension: .estimated(159))
    let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: layoutGroupSize, subitems: [layoutItem])
    let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
    layoutSection.orthogonalScrollingBehavior = .continuous
    
    let layoutSectionHeader = createSectionHeader()
    layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
    return layoutSection
  }
  
  // MARK: - Create Latest Section
  private func createSaleSection(using section: Section) -> NSCollectionLayoutSection {
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
    let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
    layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
    let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.6), heightDimension: .estimated(221))
    let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: layoutGroupSize, subitems: [layoutItem])
    let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
    layoutSection.orthogonalScrollingBehavior = .continuous
    
    let layoutSectionHeader = createSectionHeader()
    layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
    return layoutSection
  }
  
  // MARK: - Create Section Header
  private func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
    let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93), heightDimension: .estimated(30))
    let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    return layoutSectionHeader
  }
}

// MARK: - Extension Storyboarded
extension HomeViewController: Storyboarded { }
