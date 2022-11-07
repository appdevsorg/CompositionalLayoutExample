//
//  CollectionViewCell.swift
//  CompositionalLayout
//
//  Created by Anıl Peker on 13.09.2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI() {
        let images = ["resim-1",
                      "resim-2",
                      "resim-3",
                      "resim-4",
                      "resim-5"]
        
        let strongImages = images.compactMap{ UIImage(named: $0) }
        
        let randomImage = strongImages.randomElement()
        
        imageView.image = randomImage
        
    }

}

extension CollectionViewCell {
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}
