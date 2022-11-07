//
//  InstagramLayout.swift
//  CompositionalLayout
//
//  Created by Anıl Peker on 20.09.2021.
//

import UIKit

class InstagramLayout1 {
    func generateLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout {
            (section, env) -> NSCollectionLayoutSection in
            switch section {
            case 0:
                return self.getTagSliderSection()
            case 1:
                return self.getPagingSliderSection()
            default:
                return self.getMosaicSection()
            }
        }
    }
    
    private func getTagSliderSection() -> NSCollectionLayoutSection {
        // MARK: - ITEMS
        let tagItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1))
        )
        
        // MARK: - GROUPS
        let tagSliderGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(100),
                heightDimension: .absolute(20)
            ),
            subitem: tagItem,
            count: 1)
        
        
        // MARK: - SECTIONS
        let tagSliderSection = NSCollectionLayoutSection(group: tagSliderGroup)
        tagSliderSection.orthogonalScrollingBehavior = .continuous
        tagSliderSection.interGroupSpacing = 10
        tagSliderSection.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5)
        
        return tagSliderSection
    }
    
    private func getPagingSliderSection() -> NSCollectionLayoutSection {
        // MARK: - ITEMS
        let pagingSliderItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            )
        )
        
        // MARK: - GROUPS
        let pagingSliderGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(1)),
            subitem: pagingSliderItem,
            count: 1
        )
       
        
        // MARK: - SECTIONS
        let pagingSliderSection = NSCollectionLayoutSection(group: pagingSliderGroup)
        pagingSliderSection.orthogonalScrollingBehavior = .groupPaging
        
        return pagingSliderSection
    }
    
    private func getMosaicSection() -> NSCollectionLayoutSection {
        let bigItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(2/3),
                heightDimension: .fractionalWidth(2/3)
            )
        )
        
        let smallVerticalItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            )
        )
        
        let smallHorizontalItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/3),
                heightDimension: .fractionalHeight(1)
            )
        )
        
        let verticalInnerGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/3),
                heightDimension: .fractionalHeight(1)
            ),
            subitem: smallVerticalItem,
            count: 2
        )
        
        let horizontalGroupItems = [
            bigItem,
            verticalInnerGroup
        ]
        
        let horizontalLeftGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(2/3)
            ),
            subitems: horizontalGroupItems
        )
        
        let horizontalRightGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(2/3)
            ),
            subitems: horizontalGroupItems.reversed()
        )
        
        let tripleGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(1/3)
            ),
            subitem: smallHorizontalItem,
            count: 3
        )
        
        let verticalOuterGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(2)),
            subitems: [
                horizontalLeftGroup,
                tripleGroup,
                horizontalRightGroup,
                tripleGroup,
                
            ]
        )
        
        return NSCollectionLayoutSection(group: verticalOuterGroup)
    }
}
class InstagramLayout2 {
    
    func generateLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout {
            (section, env) ->  NSCollectionLayoutSection in
            
            // MARK: - ITEMS
            let tagItem = NSCollectionLayoutItem (
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
            )
            
            let carouselItem = NSCollectionLayoutItem (
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalWidth(1)
                )
            )
            
            let bigItem = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(2/3),
                    heightDimension: .fractionalHeight(1)
                )
            )
            
            let verticalSmallItem = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
            )
            
            let tripleSmallItem = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1/3),
                    heightDimension: .fractionalHeight(1)
                )
            )
            
            // MARK: - GROUPS
            
            let tagCarouselGroup = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .absolute(70),
                    heightDimension: .absolute(20)),
                subitem: tagItem,
                count: 1
            )
            
            let carouselGroup = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalWidth(1)),
                subitem: carouselItem,
                count: 1
            )
            
            let verticalStackGroup = NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1/3),
                    heightDimension: .fractionalHeight(1)),
                subitem: verticalSmallItem,
                count: 2
            )
            
            let items: [NSCollectionLayoutItem] = [
                bigItem,
                verticalStackGroup
            ]
            
            let horizontalLeftMosaicGroup = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalWidth(0.65)
                ),
                subitems: items
            )
            
            let horizontalRightMosaicGroup = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalWidth(0.65)
                ),
                subitems: items.reversed()
            )
            
            let tripleStackGroup = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalWidth(0.35)
                ),
                subitem: tripleSmallItem,
                count: 3)
            
            let verticalMainStackGroup = NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalWidth(2)
                ),
                subitems: [
                    horizontalLeftMosaicGroup, // 0,65
                    tripleStackGroup,          // 0,35
                    horizontalRightMosaicGroup,// 0,65
                    tripleStackGroup           // 0,35
                ]
            )
            
            
            // MARK: - SECTION
            let tagCarouselSection = NSCollectionLayoutSection(group: tagCarouselGroup)
            tagCarouselSection.orthogonalScrollingBehavior = .continuous
            tagCarouselSection.interGroupSpacing = 10
            tagCarouselSection.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5)
            
            let carouselSection = NSCollectionLayoutSection(group: carouselGroup)
            carouselSection.orthogonalScrollingBehavior = .groupPaging
            
            let defaultSection = NSCollectionLayoutSection(group: verticalMainStackGroup)
            
            // MARK: - RETURN
            switch section {
            case 0:
                return tagCarouselSection
            case 1:
                return carouselSection
            default:
                return defaultSection
            }
        }
    }
    
}
class InstagramLayout3 {
    func generateLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout {
            (section, env) -> NSCollectionLayoutSection in
            switch section {
            case 0:
                return self.makeTagSliderSection()
            case 1:
                return self.makePagingSliderSection()
            default:
                return self.makeInstagramSection()
            }
        }
    }
    
    private func makeTagSliderSection() -> NSCollectionLayoutSection {
        
        //MARK: - ITEM
        let tagItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            )
        )
        
        //MARK: - GROUP
        let tagGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(100),
                heightDimension: .absolute(20)
            ),
            subitem: tagItem,
            count: 1)
        
        //MARK: - SECTION
        let tagSection = NSCollectionLayoutSection(group: tagGroup)
        tagSection.orthogonalScrollingBehavior = .continuous
        tagSection.interGroupSpacing = 10
        tagSection.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5)
        
        return tagSection
        
    }
    
    private func makePagingSliderSection() -> NSCollectionLayoutSection {
        // MARK: - ITEM
        let pagingItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)))
        
        // MARK: - GROUP
        let pagingGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(1)),
            subitem: pagingItem,
            count: 1)
        
        // MARK: - SECTION
        let section = NSCollectionLayoutSection(group: pagingGroup)
        section.orthogonalScrollingBehavior = .groupPaging
        
        return section
    }
    
    private func makeInstagramSection() -> NSCollectionLayoutSection {
        // MARK: - ITEM
        let bigItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(2/3),
                heightDimension: .fractionalHeight(1))
        )
        
        let smallItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1))
        )
        
        // MARK: - GROUP
        let verticalInnerGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/3),
                heightDimension: .fractionalHeight(1)
            ),
            subitem: smallItem,
            count: 2)
        
        
        let mosaicGroup = [
            bigItem,
            verticalInnerGroup
        ]
        
        let horizontalLeftInnerGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1/3)
            ),
            subitems: mosaicGroup)
        
        let horizontalRightInnerGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1/3)
            ),
            subitems: mosaicGroup.reversed())
        
        let tripleGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1/6)),
            subitem: smallItem,
            count: 3)
        
        
        let instagramGroup = [
            horizontalLeftInnerGroup,
            tripleGroup,
            horizontalRightInnerGroup,
            tripleGroup
        ]
        
        let verticalOuterGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            ),
            subitems: instagramGroup)
        
        // MARK: - SECTION
        
        let section = NSCollectionLayoutSection(group: verticalOuterGroup)
        return section
    }
}
class IntasgramLayout4 {
    func generateLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout {
            (section, env) -> NSCollectionLayoutSection in
            switch section {
            case 0:
                return self.makeTagSliderSection()
            case 1:
                return self.makePagingSliderSection()
            default:
                return self.makeInstagramSection()
            }
        }
    }
    
    private func makeTagSliderSection() -> NSCollectionLayoutSection {
        
        //MARK: - ITEM
        let tagItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            )
        )
        
        //MARK: - GROUP
        let tagGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(100),
                heightDimension: .absolute(20)
            ),
            subitem: tagItem,
            count: 1)
        
        //MARK: - SECTION
        let tagSection = NSCollectionLayoutSection(group: tagGroup)
        tagSection.orthogonalScrollingBehavior = .continuous
        tagSection.interGroupSpacing = 10
        tagSection.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5)
        
        return tagSection
        
    }
    
    private func makePagingSliderSection() -> NSCollectionLayoutSection {
        // MARK: - ITEM
        let pagingItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)))
        
        // MARK: - GROUP
        let pagingGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(1)),
            subitem: pagingItem,
            count: 1)
        
        // MARK: - SECTION
        let section = NSCollectionLayoutSection(group: pagingGroup)
        section.orthogonalScrollingBehavior = .groupPaging
        
        return section
    }
    
    private func makeInstagramSection() -> NSCollectionLayoutSection {
        let bigItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(2/3),
                heightDimension: .fractionalWidth(2/3)
            )
        )
        
        let smallItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            )
        )
        
        let innerVGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/3),
                heightDimension: .fractionalHeight(1)
            ),
            subitem: smallItem,
            count: 2)
        
        let innerHGroupItems = [
            bigItem,
            innerVGroup
        ]
        
        let innerLeftHGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(2/3)
            ),
            subitems: innerHGroupItems
        )
        
        let innerRightHGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(2/3)
            ),
            subitems: innerHGroupItems.reversed()
        )
        
        let tripleHGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(1/3)
            ),
            subitem: smallItem,
            count: 3)
        
        let generalVGroupItems =  [
            innerLeftHGroup,    // 2/3
            tripleHGroup,       // 1/3    =    1
            innerRightHGroup,   // 2/3
            tripleHGroup        // 1/3    =    1
        ]
        
        let generalVGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(2)),
            subitems: generalVGroupItems)
        
        let section = NSCollectionLayoutSection(group: generalVGroup)
        return section
    }
    
}

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


