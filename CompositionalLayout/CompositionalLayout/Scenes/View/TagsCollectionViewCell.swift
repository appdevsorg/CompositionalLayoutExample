//
//  TagsCollectionViewCell.swift
//  CompositionalLayout
//
//  Created by Anıl Peker on 31.10.22.
//

import UIKit

class TagsCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var roundView: UIView!
    @IBOutlet private weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        roundView.layer.cornerRadius = 10
        roundView.layer.borderWidth = 0.5
        roundView.layer.borderColor = UIColor.black.withAlphaComponent(0.5).cgColor
        roundView.layer.masksToBounds = true
        roundView.clipsToBounds = true
        roundView.backgroundColor = .lightGray
    }
    
    func setupUI(index: Int) {
        label.text = "Tag \(index)"
    }
}

extension TagsCollectionViewCell {
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}
