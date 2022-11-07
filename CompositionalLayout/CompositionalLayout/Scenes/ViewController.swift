//
//  ViewController.swift
//  CompositionalLayout
//
//  Created by Anıl Peker on 13.09.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        
    }
    
    private func configureCollectionView() {
        collectionView.register(CollectionViewCell.nib,
                                forCellWithReuseIdentifier: CollectionViewCell.identifier)
        
        collectionView.register(TagsCollectionViewCell.nib,
                                forCellWithReuseIdentifier: TagsCollectionViewCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = InstagramLayout()
        collectionView.collectionViewLayout = layout.generateLayout()
    }
}
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 30
        case 1:
            return 5
        default:
            return 34
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagsCollectionViewCell.identifier, for: indexPath) as! TagsCollectionViewCell
            cell.setupUI(index: indexPath.row)
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath)
            return cell
        }
    }
}

