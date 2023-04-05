//
//  RocketViewController.swift
//  SpaceX_petProject
//
//  Created by Larry Livingston on 04.04.2023.
//

import UIKit

final class RocketViewController: UIViewController {
    private lazy var collectionView = UICollectionView(frame: .zero,
                                                       collectionViewLayout: makeCollectionViewLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
            setupEverything()
        collectionView.dataSource = dataSource
        
        applySnapshot([
            .init(type: .button, items: [.button])
        ])
    }
}

private extension RocketViewController {
    
    func applySnapshot(_ sections: [RocketSection]) {
        var snapshot = NSDiffableDataSourceSnapshot<RocketSection, RocketItem>()
        for section in sections {
            snapshot.appendSections([section])
            snapshot.appendItems(section.items, toSection: section)
        }
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    
    func setupEverything() {
        collectionView.register(RocketButtonCollectionViewCell.self, forCellWithReuseIdentifier: RocketButtonCollectionViewCell.identifire)
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
    func makeCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        .init { section, _ in
            let section = RocketSectionType.button
            switch section {
            case .button:
                let size: NSCollectionLayoutSize = .init(widthDimension: .absolute(100), heightDimension: .absolute(100))
                let item: NSCollectionLayoutItem = .init(layoutSize: size)
                
                let groupSize: NSCollectionLayoutSize = .init(widthDimension: .fractionalHeight(100), heightDimension: .fractionalHeight(100))
                let group: NSCollectionLayoutGroup = .vertical(layoutSize: groupSize, subitems: [item])
                var section: NSCollectionLayoutSection = .init(group: group)
                section.orthogonalScrollingBehavior = .continuous
                return section
            default:
                fatalError("Error")
            }
        }
    }
    
//    func makeDataSource() -> UICollectionViewDiffableDataSource<RocketSection, RocketItem> {
//        .init(collectionView: collectionView) { [weak self] collectionView, IndexPath, item in
//            switch item {
//            case .header(image, title):
//                fatalError("header")
//            case .info(title, value, _):
//                fatalError("info")
//            case .button:
//                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RocketButtonCollectionViewCell.identifire,
//                                                              for: IndexPath)
//                (cell as? RocketButtonCollectionViewCell)?.onOpenLauches = {
//                    print("test")
//                }
//                return cell
//            }
//        }
//
//    }
    func makeDataSource() -> UICollectionViewDiffableDataSource<RocketSection, RocketItem> {
        .init(collectionView: collectionView) { collectionView, indexPath, item in
            switch item {
            case .header(let image, let title):
                fatalError("header")
            case .info(let title, let value, _):
                fatalError("info")
            case .button:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RocketButtonCollectionViewCell.identifire,
                                                              for: indexPath)
                (cell as? RocketButtonCollectionViewCell)?.onOpenLauches = {
                    print("test")
                }
                return cell
            }
        }
    }
}

extension RocketViewController: UICollectionViewDataSource {
    
}

private extension RocketViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let section = RocketSection.button
        let item = RocketItem.button
        switch item {
        case .header(let image, let title):
            fatalError("header")
        case .info(let title, let value, _):
            fatalError("info")
        case .button:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RocketButtonCollectionViewCell.identifire,
                                                          for: indexPath)
            (cell as? RocketButtonCollectionViewCell)?.onOpenLauches = {
                print("test")
            }
            return cell
        }
    }
    )
//    private lazy var dataSource = makeDataSource()
    
}
