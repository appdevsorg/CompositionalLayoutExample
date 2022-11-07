//
//  InstagramLayout.swift
//  CompositionalLayout
//
//  Created by Anıl Peker on 20.09.2021.
//

import UIKit

class InstagramLayout {
    func generateLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout {
            (section, env) -> NSCollectionLayoutSection in
            switch section {
            case 0:
                return self.makeTagSliderLayout()
            case 1:
                return self.makePagingSliderLayout()
            default:
                return self.makeInstagramLayout()
            }
        }
    }
    
    
    private func makeTagSliderLayout() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            )
        )
        
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(100),
                heightDimension: .absolute(20)),
            subitem: item,
            count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 10
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5)
        
        return section
    }
    
    private func makePagingSliderLayout() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            )
        )
        
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(1)),
            subitem: item,
            count: 1)
        
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        
        return section
    }
    
    private func makeInstagramLayout() -> NSCollectionLayoutSection {
        let smallItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            )
        )
        let bigItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(2/3),
                heightDimension: .fractionalWidth(2/3)
            )
        )
        
        let innerVGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/3),
                heightDimension: .fractionalHeight(1)
            ),
            subitem: smallItem,
            count: 2)
        
        let mosaicGroup = [
            bigItem,
            innerVGroup
        ]
        
        let innerHLeftGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(2/3)
            ),
            subitems: mosaicGroup)
        
        let innerHRightGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(2/3)
            ),
            subitems: mosaicGroup.reversed())
        
        let tripleGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(1/3)),
            subitem: smallItem,
            count: 3)
        
        let generalGroup = [
            innerHLeftGroup,
            tripleGroup,
            innerHRightGroup,
            tripleGroup
        ]
        
        
        let generalVGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(2)),
            subitems: generalGroup)
        
        
        let section = NSCollectionLayoutSection(group: generalVGroup)
        return section
        
    }
    
    
}


