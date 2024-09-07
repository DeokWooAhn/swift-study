//
//  QuickFocusCell.swift
//  HeadSpaceFocus
//
//  Created by 안덕우 on 9/7/24.
//

import UIKit

class QuickFocusCell: UICollectionViewCell {
    
    @IBOutlet weak var thubnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func configure(_ quickFoucs: QuickFocus) {
        thubnailImageView.image = UIImage(named: quickFoucs.imageName)
        titleLabel.text = quickFoucs.title
        descriptionLabel.text = quickFoucs.description
    }
}
